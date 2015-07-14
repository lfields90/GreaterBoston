class CitiesController < ApplicationController
  def index
    if params[:search]
      @cities = City.search(params[:search]).order("created_at DESC")
      @cities = @cities.page(params[:page])
    else
      @cities = City.order("created_at DESC").page params[:page]
    end
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(city_params)
    @city.user = current_user
    @state = @city.state
    if @city.save
      flash[:success] = "City added."
      redirect_to cities_path
    else
      flash[:alert] = @city.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @city = City.find(params[:id])
    if params[:search]
      redirect_to cities_path(search: params[:search])
      @cities = City.search(params[:search]).order("name DESC")
      @cities = @cities.page(params[:page])
    end
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if (current_user && current_user.id == @city.user_id) ||
        (current_user && current_user.admin?)
      if @city.update(city_params)
        flash[:success] = "City updated."
        redirect_to city_path(@city)
      else
        flash[:alert] = @city.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that city."
      redirect_to city_path(@city)
    end
  end

  def destroy
    @city = City.find(params[:id])
    if (current_user && current_user.id == @city.user_id) ||
        (current_user && current_user.admin?)
      @city.destroy
      flash[:success] = "City deleted"
      redirect_to cities_path
    else
      flash[:alert] = "You don't have permission to delete that city."
      redirect_to city_path(@city)
    end
  end

  private

  def city_params
    params.require(:city).permit(
      :name,
      :description,
      :state,
      :website_url,
      :user
    )
  end
end
