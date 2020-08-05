class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def new
    @post = Post.new
    @user = User.find(params[:user_id])
  end

  def destroy
  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    user = User.find(params[:user_id])
    if @post.update(post_params)
      redirect_to user_path(user)
    else
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id, :main_image)
  end 
end
