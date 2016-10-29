class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(events_params)

    @event.save
    redirect_to :action => :index
  end

  private

  def events_params
    params.require(:event).permit(:name, :description)
  end

end
