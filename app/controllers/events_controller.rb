class EventsController < ApplicationController
  def index
    @neighborhood = Neighborhood.find(params[:neighborhood_id])
    @events = @neighborhood.events.order("created_at DESC")
    @featured_events = @events.limit(3)
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
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:success] = "Event updated."
      redirect_to event_path(@event)
    else
      flash[:alert] = @event.errors.full_messages.join(".  ")
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Event deleted"
    redirect_to neighborhood_events_path(@event.neighborhood)
  end

  protected

  def event_params
    params.require(:event).permit(
      :name,
      :category_id,
      :event_header,
      :description,
      :date,
      :host,
      :address,
      :city,
      :state,
      :zip_code,
      :neighborhood_id,
      :phone,
      :website_url,
      :photo_url,
      :facebook_url,
      :twitter_url,
      :event_brite_url,
      :meet_up_url,
      :category_id,
      :user
    )
  end
end
