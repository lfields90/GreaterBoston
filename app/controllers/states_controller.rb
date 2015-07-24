class StatesController < ApplicationController
  def index
    @states = State.order("created_at DESC").page params[:page]
  end

  def new
    @state = State.new
    redirect_to states_path unless current_user.admin?
  end

  def create
    @state = State.new(state_params)
    if current_user.admin?
      if @state.save
        flash[:success] = "State added."
        redirect_to states_path
      else
        flash[:alert] = @state.errors.full_messages.join(".  ")
        render :new
      end
    else
      flash[:alert] = "You don't have permission to create a state."
      redirect_to state_cities_path(@city.state)
    end
  end

  def show
    @state = State.find(params[:id])
  end

  def edit
    @state = State.find(params[:id])
    redirect_to states_path unless current_user.admin?
  end

  def update
    @state = State.find(params[:id])
    if current_user.admin?
      if @state.update(state_params)
        flash[:success] = "State updated."
        redirect_to state_path(@state)
      else
        flash[:alert] = @state.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to update this state."
      redirect_to state_path(@state)
    end
  end

  def destroy
    @state = State.find(params[:id])
    if current_user.admin?
      @state.destroy
      flash[:success] = "State deleted"
      redirect_to states_path
    else
      flash[:alert] = "You don't have permission to update this state."
      redirect_to state_path(@state)
    end
  end

  protected

  def state_params
    params.require(:state).permit(
      :name,
      :description,
      :website_url,
    )
  end
end
