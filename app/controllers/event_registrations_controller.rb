class EventRegistrationsController < ApplicationController
  before_action :require_sign_in

  def create
    @event = Event.find(params[:event_id])
    @registration = EventRegistration.new(event_id: @event.id, attendee_id: current_user.id)
    

    if @registration.save
      redirect_to @event, notice: "Registered!"
    else
      redirect_to @event, alert: "Something went wrong..."
    end
  end


end
