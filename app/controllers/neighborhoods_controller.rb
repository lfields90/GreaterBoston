class NeighborhoodsController < ApplicationController
  def index
    if params[:search]
      @neighborhoods = Neighborhood.search(params[:search]).order("created_at DESC")
      @neighborhoods = @neighborhoods.page(params[:page])
    else
      @neighborhoods = Neighborhood.order("created_at DESC").page params[:page]
    end
  end

  def new
    @neighborhood = Neighborhood.new
    @city = City.find(params[:city_id])
  end

  def create
    @city = City.find(params[:city_id])
    @neighborhood = Neighborhood.new(neighborhood_params)
    @neighborhood.city = @city
    if @neighborhood.save
      flash[:success] = "Neighborhood added."
      redirect_to city_neighborhoods_path(@city)
    else
      flash[:alert] = @neighborhood.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @city = @neighborhood.city
    if params[:search]
      redirect_to neighborhoods_path(search: params[:search])
      @neighborhoods = Neighborhood.search(params[:search]).order("name DESC")
      @neighborhoods = @neighborhoods.page(params[:page])
    end
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])
    if (current_user && current_user.id == @neighborhood.user_id) ||
        (current_user && current_user.admin?)
      if @neighborhood.update(neighborhood_params)
        flash[:success] = "Neighborhood updated."
        redirect_to neighborhood_path(@neighborhood)
      else
        flash[:alert] = @neighborhood.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that neighborhood."
      redirect_to neighborhood_path(@neighborhood)
    end
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @city = @neighborhood.city
    if (current_user && current_user.id == @neighborhood.user_id) ||
      (current_user && current_user.admin?)
      @neighborhood.destroy
      flash[:success] = "Neighborhood deleted"
      redirect_to city_neighborhoods_path(@city)
    else
      flash[:alert] = "You don't have permission to delete that neighborhood."
      redirect_to city_neighborhoods_path(@city)
    end
  end

  private

  def neighborhood_params
    params.require(:neighborhood).permit(
      :name,
      :description,
      :city,
      :website_url,
    )
  end
end
