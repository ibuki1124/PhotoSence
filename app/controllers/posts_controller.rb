class PostsController < ApplicationController
  before_action :is_post_user?, only: [:edit, :update]

  def top
  end
  
  def search
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.vision_image.attached?
      tags = Vision.get_image_data(post_params[:vision_image])
    else
      tags = ["none"]
    end
    if @post.save
      tags.each do |tag|
        @post.tags.create(name: tag)
      end
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    @q = Tag.ransack(params[:q])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :vision_image)
  end

  def is_post_user?
    @post = Post.find(params[:id])
    unless @post.user_id == current_user.id
      redirect_to post_path(@post)
    end
  end
end
