class PostsController < ApplicationController
  before_filter :authenticate_user!
  def index
    @post = Post.all
  end
  def show
    @post = Post.find(params[:id])
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
    @post = Post.find(params[:id])
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to(@post)
  end
end
