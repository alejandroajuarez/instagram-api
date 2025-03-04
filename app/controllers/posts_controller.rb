class PostsController < ApplicationController

  # In PostsController
  def index
    if params[:user_id]
      @posts = Post.where(user_id: params[:user_id]).order(created_at: :desc)
    else
      @posts = Post.all.order(created_at: :desc)
    end
    render :index
  end

  def show
    id_find = params[:id]
    @post = Post.find_by(id: id_find)
    render :show
  end

  def create
    @post = Post.new(
      user_id: current_user.id,
      image_url: params[:image_url],
      caption: params[:caption]
    )
    if @post.save
      render :show
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find_by(id: params[:id])
    post.username = params[:username],
    post.image_url = params[:image_url],
    post.caption = params[:caption]

    if @post.save!
      render :show
    else
      render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: {message: "Post has been deleted Successfully!"}
  end
end
