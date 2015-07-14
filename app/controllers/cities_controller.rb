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
