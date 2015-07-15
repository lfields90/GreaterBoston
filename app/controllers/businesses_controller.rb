class BusinessesController < ApplicationController
  def index
    if params[:search]
      @businesses = Business.search(params[:search]).order("created_at DESC")
      @businesses = @businesses.page(params[:page])
    else
      @businesses = Business.order("created_at DESC").page params[:page]
    end
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(business_params)
    @business.user = current_user
    if @business.save
      flash[:success] = "Business added."
      redirect_to businesses_path
    else
      flash[:alert] = @business.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @business = Business.find(params[:id])
    @reviews = @business.reviews.order('created_at DESC').page(params[:page])
    if params[:search]
      redirect_to businesses_path(search: params[:search])
      @businesses = Business.search(params[:search]).order("name DESC")
      @businesses = @businesses.page(params[:page])
    end
  end

  def edit
    @business = Business.find(params[:id])
  end

  def update
    @business = Business.find(params[:id])
    if (current_user && current_user.id == @business.user_id) ||
        (current_user && current_user.admin?)
      if @business.update(business_params)
        flash[:success] = "Business updated."
        redirect_to business_path(@business)
      else
        flash[:alert] = @business.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that business."
      redirect_to business_path(@business)
    end
  end

  def destroy
    @business = Business.find(params[:id])
    if (current_user && current_user.id == @business.user_id) ||
        (current_user && current_user.admin?)
      @business.destroy
      flash[:success] = "Business deleted"
      redirect_to businesses_path
    else
      flash[:alert] = "You don't have permission to delete that business."
      redirect_to business_path(@business)
    end
  end

  protected

  def business_params
    params.require(:business).permit(
      :name,
      :description,
      :address,
      :city,
      :state,
      :zip_code,
      :neighborhood,
      :phone,
      :website_url,
      :photo_url,
      :facebook_url,
      :twitter_url,
      :yelp_url,
      :user
    )
  end
end
