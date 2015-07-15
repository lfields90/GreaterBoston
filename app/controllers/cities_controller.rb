class CitiesController < ApplicationController
  def index
    @state = State.find(params[:state_id])
    @cities = @state.cities.order("name").page params[:page]
  end

  def new
    @city = City.new
    @state = State.find(params[:state_id])
  end

  def create
    @state = State.find(params[:state_id])
    @city = City.new(city_params)
    @city.state = @state
    if @city.save
      flash[:success] = "City added."
      redirect_to state_cities_path(@state)
    else
      flash[:alert] = @city.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @city = City.find(params[:id])
    @state = @city.state
  end

  def edit
    @city = City.find(params[:id])
  end

  def update
    @city = City.find(params[:id])
    if @city.update(city_params)
      flash[:success] = "City updated."
      redirect_to city_path(@city)
    else
      flash[:alert] = @city.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @city = City.find(params[:id])
    @city.destroy
    flash[:success] = "City deleted"
    redirect_to cities_path
  end

  protected

  def city_params
    params.require(:city).permit(
      :name,
      :description,
      :state,
      :website_url,
    )
  end
end
