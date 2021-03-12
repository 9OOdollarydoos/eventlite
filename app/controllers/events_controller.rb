class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end

  def new
    @event = current_user.event.new
  end

  def create
    @event = current_user.events.new(event_params)
    if @event.save
      redirect_to root_path, notice: 'Event created successfully.'
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
  
