class EventsController < ApplicationController
  def index
    if params[:search]
      @events = Event.search(params[:search]).order("created_at DESC")
      @events = @events.page(params[:page])
    else
      @events = Event.order("created_at DESC").page params[:page]
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      flash[:success] = "Event added."
      redirect_to events_path
    else
      flash[:alert] = @event.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @reviews = @event.reviews.order('created_at DESC').page(params[:page])
    if params[:search]
      redirect_to events_path(search: params[:search])
      @events = Event.search(params[:search]).order("name DESC")
      @events = @events.page(params[:page])
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if (current_user && current_user.id == @event.user_id) ||
        (current_user && current_user.admin?)
      if @event.update(event_params)
        flash[:success] = "Event updated."
        redirect_to event_path(@event)
      else
        flash[:alert] = @event.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that event."
      redirect_to event_path(@event)
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if (current_user && current_user.id == @event.user_id) ||
        (current_user && current_user.admin?)
      @event.destroy
      flash[:success] = "Event deleted"
      redirect_to events_path
    else
      flash[:alert] = "You don't have permission to delete that event."
      redirect_to event_path(@event)
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :description,
      :address,
      :city,
      :state,
      :zip_code,
      :neighborhood,
      :phone,
      :website_url,
      :photo_url,
      :facebook_url,
      :twitter_url,
      :event-brite_url,
      :meet-up_url,
      :user
    )
  end
end
