class NeighborhoodsController < ApplicationController
  def index
    @city = City.find(params[:city_id])
    @neighborhoods = @city.neighborhoods.order("name").page params[:page]
  end

  def new
    @neighborhood = Neighborhood.new
    @city = City.find(params[:city_id])
    redirect_to city_neighborhoods_path(@city) unless current_user.admin?
  end

  def create
    @city = City.find(params[:city_id])
    @neighborhood = Neighborhood.new(neighborhood_params)
    @neighborhood.city = @city
    if current_user.admin?
      if @neighborhood.save
        flash[:success] = "Neighborhood added."
        redirect_to city_neighborhoods_path(@city)
      else
        flash[:alert] = @neighborhood.errors.full_messages.join(".  ")
        render :new
      end
    else
      flash[:alert] = "You don't have permission to create a neighborhood."
      redirect_to city_neighborhoods_path(@city)
    end
  end

  def show
    @neighborhood = Neighborhood.find(params[:id])
    @city = @neighborhood.city
    @events = @neighborhood.events.order("created_at DESC")
    @featured_events = @events.limit(3)
  end

  def edit
    @neighborhood = Neighborhood.find(params[:id])
    redirect_to city_neighborhoods_path(@city) unless current_user.admin?
  end

  def update
    @neighborhood = Neighborhood.find(params[:id])
    @city = @neighborhood.city
    if current_user.admin?
      if @neighborhood.update(neighborhood_params)
        flash[:success] = "Neighborhood updated."
        redirect_to neighborhood_path(@neighborhood)
      else
        flash[:alert] = @neighborhood.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit a neighborhood."
      redirect_to neighborhood_path(@neighborhood)
    end
  end

  def destroy
    @neighborhood = Neighborhood.find(params[:id])
    @city = @neighborhood.city
    if current_user.admin?
      @neighborhood.destroy
      flash[:success] = "Neighborhood deleted"
      redirect_to city_neighborhoods_path(@city)
    else
      flash[:alert] = "You don't have permission to delete a neighborhood."
      city_neighborhoods_path(@city)
    end
  end

  protected

  def neighborhood_params
    params.require(:neighborhood).permit(
      :name,
      :description,
      :city,
      :website_url,
    )
  end
end
