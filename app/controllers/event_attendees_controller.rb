class EventAttendeesController < ApplicationController
  before_action :set_event
  before_action :set_attendee, :except => [:index, :new, :create]

  def index
    @attendees = @event.attendees
  end

  def show
  end

  def new
    @attendee = @event.attendees.new
  end

  def create
    @attendee = @event.attendees.new(attendee_params)
    if @attendee.save
      redirect_to event_attendee_path(@event, @attendee)
    else
      render :action => "new"
    end
  end

  def destroy
    @attendee.destroy

    redirect_to event_attendees_path(@event)
  end

  def edit
  end

  def update
    if @attendee.update(attendee_params)
      redirect_to event_attendee_path(@event, @attendee)
    else
      render :action => "edit"
    end
  end

  private

  def attendee_params
    params.require(:attendee).permit(:name)
  end

  def set_event
    # Parameter:{ :event_id => ?}
    @event = Event.find(params[:event_id])
  end

  def set_attendee
    @attendee = @event.attendees.find(params[:id])
  end

end
