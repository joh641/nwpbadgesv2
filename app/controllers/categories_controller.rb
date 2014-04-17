class CategoriesController < ApplicationController
  before_filter :is_admin

  def index
    @categories = Category.all
  end

  def create
    category = Category.create :name => params[:category_name]
    redirect_to :back, notice: "Category #{category.name} successfully created"
  end

  def edit
    @category = Category.find_by_id params[:id]
  end

  def update
    @category = Category.find_by_id params[:id]
    @category.update_attributes params[:category]
    redirect_to categories_path, notice: "Category #{@category.name} was successfully updated."
  end

  def destroy
    category = Category.find_by_id params[:id]
    category.destroy
    redirect_to categories_path, notice: "#{category.name} was deleted."
  end

end