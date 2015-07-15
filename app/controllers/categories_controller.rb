class CategoriesController < ApplicationController
  def index
    if params[:search]
      @categories = Category.search(params[:search]).order("created_at DESC")
      @categories = @categories.page(params[:page])
    else
      @categories = Category.order("created_at DESC").page params[:page]
    end
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
    if (current_user && current_user.id == @category.user_id) ||
        (current_user && current_user.admin?)
      if @category.update(categories_params)
        flash[:success] = "Category updated."
        redirect_to categories_path(@category)
      else
        flash[:alert] = @category.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that category."
      redirect_to categories_path(@category)
    end
  end

  def destroy
    @category = Category.find(params[:id])
    if (current_user && current_user.id == @category.user_id) ||
        (current_user && current_user.admin?)
      @category.destroy
      flash[:success] = "Category deleted"
      redirect_to categories_path
    else
      flash[:alert] = "You don't have permission to delete that category."
      redirect_to categories_path(@category)
    end
  end

  protected

  def category_params
    params.require(:category).permit( :name )
  end
end
