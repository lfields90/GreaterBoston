class EventsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @events = @neighborhood.events.order("date DESC")
    @featured_events = @events.where(featured: true)
  end

  def new
    @event = Event.new
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
  end

  def create
    @event = Event.new(event_params)
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @event.neighborhood = @neighborhood
    @event.user_id = current_user.id
    if @event.save
      flash[:success] = "Event added."
      redirect_to neighborhood_events_path(@neighborhood)
    else
      flash[:alert] = @event.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @reviews = @event.reviews
  end

  def edit
    @event = Event.find(params[:id])
    @user = current_user
    redirect_to event_path(@event) unless @user.id == @event.user_id || @user.admin?
  end

  def update
    @event = Event.find(params[:id])
    if (current_user.id == @event.user_id) || current_user.admin?
      if @event.update(event_params)
        flash[:success] = "Event updated."
        redirect_to event_path(@event)
      else
        flash[:alert] = @event.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that review."
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if (current_user.id == @event.user_id) || current_user.admin?
      @review.destroy
      flash[:notice] = "Review deleted"
      redirect_to event_path(@event)
    else
      flash[:alert] = "You don't have permission to delete that review."
      redirect_to event_path(@event)
    end


    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to neighborhood_events_path(@event.neighborhood)
  end

  protected

  def event_params
    params.require(:event).permit(
      :name,
      :category_id,
      :description,
      :date,
      :address,
      :city,
      :state,
      :neighborhood_id,
      :featured,
      :photo_url,
      :facebook_url,
      :twitter_url,
      :user
    )
  end
end
