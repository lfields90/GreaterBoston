class ReviewsController < ApplicationController
  def new
    @event = Event.find params[:event_id]
    @review = Review.new
    @ratings = [1, 2, 3, 4, 5]
  end

  def create
    @event = Event.find(params[:event_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.event_id = @event.id
    if @event.reviews.include?(current_user.id)
      flash[:alert] = "You can't review an event mulitple times."
      redirect_to event_path(@event)
    end
    if (current_user) == @event.user_id || current_user.admin?
      if @review.save
        flash[:success] = "Review added"
        redirect_to event_path(@event)
      else
        flash[:alert] = @review.errors.full_messages.join(".  ")
        render :new
      end
    end
  end

  def upvote
    @review = Review.find(params[:id])
    @review.vote_count += 1
    @review.save
    if @review.save
      render json: { status: "good" }
    else
      render json: { status: "bad" }
    end
  end

  def downvote
    @review = Review.find(params[:id])
    @review.vote_count -= 1
    if @review.save
      render json: { status: "good" }
    else
      render json: { status: "bad" }
    end
  end

  def edit
    @event = Event.find params[:event_id]
    @review = Review.find(params[:id])
    @ratings = [1, 2, 3, 4, 5]
    @user = current_user
    redirect_to event_path(@event) unless @user.id == @event.user || @user.admin?
  end

  def update
    @event = Event.find params[:event_id]
    @review = Review.find(params[:id])
    if (current_user.id == @review.user_id) || current_user.admin?
      if @review.update(review_params)
        flash[:success] = "Review updated"
        redirect_to event_path(@event)
      else
        flash[:alert] = @review.errors.full_messages.join(".  ")
        render :edit
      end
    else
      flash[:alert] = "You don't have permission to edit that review."
      redirect_to event_path(@event)
    end
  end


  def destroy
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
    if (current_user.id == @review.user_id) || current_user.admin?
      @review.destroy
      flash[:notice] = "Review deleted"
      redirect_to event_path(@event)
    else
      flash[:alert] = "You don't have permission to delete that review."
      redirect_to event_path(@event)
    end
  end

  private

  def review_params
    params.require(:review).permit(:body, :rating, :event_id, :user_id)
  end
end
