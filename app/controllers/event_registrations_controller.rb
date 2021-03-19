class EventRegistrationsController < ApplicationController
  before_action :require_sign_in

  def create
    @event = Event.find(params[:event_id])
    #adding requirement to be invited
    
    @invited = current_user.invited_events.where(id: @event.id).exists?


    if @invited
      @registration = EventRegistration.new(event_id: @event.id, attendee_id: current_user.id)
      if @registration.save
        @invite = Invitation.find_by event_id: @event.id, invitee_id: current_user.id
        @invite.destroy #delete the invite as its been accepted
        redirect_to @event, notice: "Registered!"
      else
        redirect_to @event, alert: "Something went wrong..."
      end
    else
      redirect_to @event, alert: "You need to be invited to sign up"
    end

    
  end


end
