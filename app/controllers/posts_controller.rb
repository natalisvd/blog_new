class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @post = current_user.posts.all
  end
  def show
    @post = current_user.posts.find(params[:id])
  end
  def new
    @post = Post.new
  end
  def create

    @post = current_user.posts.new(params[:post].permit(:title, :body))
    @post.save
    redirect_to(@post, :notice => "post create" )
  end

  def edit
    @post = current_user.posts.find(params[:id])
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to(@post)
  end
end
