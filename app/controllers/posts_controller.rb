class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:id]
      @posts = Post.where(category_id: params[:id]).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
  end

  def new
    @post = Post.new
  end 

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    category_id = post.category_id
    post.destroy
    redirect_to category_id ? category_image_path(category_id) : posts_path
  end
  
  private

  def post_params
    params.require(:post).permit(:image, :place, :content, :category_id, :public_id).merge(user_id: current_user.id)
  end

end