class EventsController < ApplicationController
  def index
    @upcoming_events = Event.future
    @previous_events = Event.past
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    @event.date = Time.now.tomorrow
    if @event.save
      flash[:success] = "Event created!"
      redirect_to events_path
    else
      render 'new'
    end
  end
  
  private
  def event_params
    params.require(:event).permit(:description, :location)
  end
end
