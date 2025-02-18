class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :index
  end

  def show
    id_find = params[:id]
    @post = Post.find_by(id: id_find)
    render :show
  end

  def create
    @post = Post.new!(
      username: params[:username],
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
