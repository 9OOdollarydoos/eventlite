class EventsController < ApplicationController
  before_action :require_sign_in, only: [:new, :create]

  def index
    @events = Event.all
  end

  def new
    @event = current_user.hosted_events.build
  end

  def create
    @event = current_user.hosted_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event create successfully!"
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :date)
  end

end
  
