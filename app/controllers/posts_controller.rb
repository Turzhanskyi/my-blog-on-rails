# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, success: 'Допис успішно створено'
    else
      render :new, danger: 'Допис не створено'
    end
  end

  def edit; end

  def update
    if @post.update(post_params)
      redirect_to @post, success: 'Допис успішно оновлено'
    else
      render :edit, danger: 'Допис не оновлено'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Допис успішно видалено'
  end

  private

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
