class PostController < Amber::Controller::Base
  def index
    posts = Post.all
    # context = context.not_nil!
    render("index.slang")
  end

  def show
    if post = Post.find params["id"]
      render("show.slang")
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def new
    post = Post.new
    render("new.slang")
  end

  def create
    post = Post.new(params.to_h.select(["title", "content"]))

    if post.valid? && post.save
      context.flash["success"] = "Created Post successfully."
      redirect_to "/posts"
    else
      context.flash["danger"] = "Could not create Post!"
      render("new.slang")
    end
  end

  def edit
    if post = Post.find params["id"]
      render("edit.slang")
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def update
    if post = Post.find(params["id"])
      puts "inside update block"
      post.set_attributes(params.to_h.select(["title", "content"])) 
      if post.valid? && post.save
        puts "it was valid"
        context.flash["success"] = "Updated Post successfully."
        redirect_to "/posts"
      else
        puts "it wasn't valid"
        context.flash["danger"] = "Could not update Post!"
        render("edit.slang")
      end
    else
      puts "not inside block"
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
      redirect_to "/posts"
    end
  end

  def destroy
    if post = Post.find params["id"]
      post.destroy
    else
      context.flash["warning"] = "Post with ID #{params["id"]} Not Found"
    end
    redirect_to "/posts"
  end
end
