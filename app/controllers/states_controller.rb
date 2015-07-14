class StatesController < ApplicationController
  def index
    if params[:search]
      @states = State.search(params[:search]).order("created_at DESC")
      @states = @states.page(params[:page])
    else
      @states = State.order("created_at DESC").page params[:page]
    end
  end

  def new
    @state = State.new
  end

  def create
    @state = State.new(state_params)
    binding.pry
    @state.user = current_user
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
    if params[:search]
      redirect_to states_path(search: params[:search])
      @states = State.search(params[:search]).order("name DESC")
      @states = @states.page(params[:page])
    end
  end

  def edit
    @state = State.find(params[:id])
  end

  def update
    @state = State.find(params[:id])
    if (current_user && current_user.id == @state.user_id) ||
        (current_user && current_user.admin?)
      if @state.update(state_params)
        flash[:success] = "State updated."
        redirect_to state_path(@state)
      else
        flash[:alert] = @state.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that state."
      redirect_to state_path(@state)
    end
  end

  def destroy
    @state = State.find(params[:id])
    if (current_user && current_user.id == @state.user_id) ||
        (current_user && current_user.admin?)
      @state.destroy
      flash[:success] = "State deleted"
      redirect_to states_path
    else
      flash[:alert] = "You don't have permission to delete that state."
      redirect_to state_path(@state)
    end
  end

  private

  def state_params
    params.require(:state).permit(
      :name,
      :description,
      :website_url,
      user: current_user
    )
  end
end
