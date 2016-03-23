class InvitesController < ApplicationController
  def new
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    invites = []
    params[:user_ids].each do |user_id, value|
      invites << @event.invites.build(attendee_id: user_id) if value == "1"
    end
    invites.each { |invite| invite.save }
    length = invites.length
    flash[:success] = "#{length} " + "invite".pluralize(length) + " sent!"
    redirect_to @event
  end
end
