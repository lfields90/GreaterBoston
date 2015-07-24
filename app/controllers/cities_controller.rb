class CitiesController < ApplicationController
  def index
    @state = State.find(params[:state_id])
    @cities = @state.cities.order("name").page params[:page]
  end

  def new
    @city = City.new
    @state = State.find(params[:state_id])
    redirect_to state_cities_path(@state) unless current_user.admin?
  end

  def create
    @state = State.find(params[:state_id])
    @city = City.new(city_params)
    @city.state = @state
    if current_user.admin?
      if @city.save
        flash[:success] = "City added."
        redirect_to state_cities_path(@state)
      else
        flash[:alert] = @city.errors.full_messages.join(".  ")
        render :new
      end
    else
      flash[:alert] = "You don't have permission to update this city."
      redirect_to state_cities_path(@city.state)
    end
  end

  def show
    @city = City.find(params[:id])
    @state = @city.state
  end

  def edit
    @city = City.find(params[:id])
    redirect_to state_cities_path(@city.state) unless current_user.admin?
  end

  def update
    @city = City.find(params[:id])
    if current_user.admin?
      if @city.update(city_params)
        flash[:success] = "City updated."
        redirect_to state_cities_path(@city.state)
      else
        flash[:alert] = @city.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to update this city."
      redirect_to state_cities_path(@city.state)
    end
  end

  def destroy
    @city = City.find(params[:id])
    if current_user.admin?
      @city.destroy
      flash[:success] = "City deleted"
      redirect_to state_cities_path(@city.state)
    else
      flash[:alert] = "You don't have permission to delete this city."
      redirect_to state_cities_path(@city.state)
    end
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
