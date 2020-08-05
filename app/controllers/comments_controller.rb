class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :new_comment, only: [:new, :create]
  before_action :set_comment, only: [:show, :edit]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = @post.comments.build
    # @comment["user_id"] = current_user.id 
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment["user_id"] = current_user.id 

    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def new_comment
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id)
  end
end
