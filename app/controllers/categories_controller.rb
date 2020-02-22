# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категорію успішно створено'
    else
      flash[:danger] = 'Категорію не створено'
      render :new
    end
  end

  def edit; end

  def update
    if @category.update(category_params)
      redirect_to categories_path, success: 'Категорію успішно оновлено'
    else
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
    params.require(:category).permit(:name)
  end
end
