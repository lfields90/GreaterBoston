class StatesController < ApplicationController
  def index
    @states = State.order("created_at DESC").page params[:page]
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    if @state.save
      flash[:success] = "State added."
      redirect_to states_path
    else
      flash[:alert] = @state.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @state = State.find(params[:id])
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])
    if @state.update(state_params)
      flash[:success] = "State updated."
      redirect_to state_path(@state)
    else
      flash[:alert] = @state.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    flash[:success] = "State deleted"
    redirect_to states_path
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
