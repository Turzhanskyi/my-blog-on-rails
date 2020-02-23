# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: %i[show]
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
    @posts = Post.where(category_id: [@category.subtree_ids]).paginate(page: params[:page], per_page: 5)
  end

  def new
    @category = Category.new
    @categories = Category.all.order(:name)
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категорію успішно створено'
    else
      @categories = Category.all.order(:name)
      flash[:danger] = 'Категорію не створено'
      render :new
    end
  end

  def edit
    @categories = Category.where("id != #{@category.id}").order(:name)
  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Категорію успішно оновлено'
    else
      @categories = Category.where("id != #{@category.id}").order(:name)
      flash[:danger] = 'Категорію не оновлено'
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, success: 'Категорію успішно видалено'
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end
end
