class InvitationsController < ApplicationController
  before_action :require_sign_in
  
  def create
    @invitation = Invitation.new(event_id: invite_params[:event_id], invitee_id: User.find_by(username: invite_params[:username]).id)
    @event = Event.find(invite_params[:event_id])

    if @invitation.save
      redirect_to @event, notice: "User Invited!"
    else
      redirect_to @event, alert: "Something went wrong..."
    end
  end

  def destroy
    #to do!
  end
  
  private

  def invite_params
    params.require(:invitation).permit(:username, :event_id)
  end

end
