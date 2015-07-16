class CategoriesController < ApplicationController
  def index
    @categories = Category.order("created_at DESC").page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Category added."
      redirect_to categories_path
    else
      flash[:alert] = @category.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    if params[:search]
      redirect_to categories_path(search: params[:search])
      @categories = Category.search(params[:search]).order("name DESC")
      @categories = @categories.page(params[:page])
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update(categories_params)
      flash[:success] = "Category updated."
      redirect_to categories_path(@category)
    else
      flash[:alert] = @category.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = "Category deleted"
    redirect_to categories_path
  end

  protected

  def category_params
    params.require(:category).permit( :name )
  end
end
