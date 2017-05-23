# Location for your initialization code
# {YourApp}/src/config/app.cr

# The config file that Amber generates, web/router.cr, will look something like
# this one:

# The first line requires the framework library.
require "amber"
require "./**"
require "./*"
require "../config/*"

MY_APP_SERVER = Amber::Server.instance

# This line represents how you will define your application configuration.
MY_APP_SERVER.config do |app|
  # Server options
  app_path = __FILE__          # Do not change unless you understand what you are doing.
  app.name = "Hello World App" # A descriptive name for your app
  app.port = 4000              # Port you wish your app to run
  app.env = "development".colorize(:yellow).to_s
  app.log = ::Logger.new(STDOUT)
  app.log.level = ::Logger::INFO

  # Every Amber application needs to define a pipeline set of pipes
  # each pipeline allow a set of middleware transformations to be applied to
  # different sets of route, this give you granular control and explicitness
  # of which transformation to run for each of the app requests.

  # All api scoped routes will run these transformations
  # This is how you define the routes for your application
  # HTTP methods supported [GET, PATCH, POST, PUT, DELETE, OPTIONS]
  # Read more about HTTP methods here
  # (HTTP METHODS)[https://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html]
  #
  # # Routes accepts a pipeline name and a scope a pipeline represents a stach of
  # # http handlers that will process the current request
  # routes :web, "/v2" do
  #   # You can also define all resources at once with the resources macro.
  #   # This will define the following routes
  #   # resources path, controller, actions
  #   # resources "/user", UserController, [:index, :show]
  #   # resources "/user", UserController, actions: [:index, :show]
  #   #
  #   # GET     /users          UserController  :index
  #   # GET     /users/:id/edit UserController  :edit
  #   # GET     /users/new      UserController  :new
  #   # GET     /users/:id      UserController  :show
  #   # POST    /users          UserController  :create
  #   # PATCH   /users/:id      UserController  :update
  #   # PUT     /users/:id      UserController  :update
  #   # DELETE  /users/:id      UserController  :delete
  #
  #   resources "/hello", HelloController, [:index, :show]
  #   get "/hello/world/:planet", HelloController, :world
  #   get "/hello/template", HelloController, :template
  # end
end

# Run the server
MY_APP_SERVER.run
