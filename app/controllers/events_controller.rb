class EventsController < ApplicationController
  before_action :set_event, :only => [:show, :edit, :update, :destroy]

  # /events/index => index.html.erb
  def index
    @events = Event.page(params[:page]).per(5) # [<Event id:1>, <Event id:2>, <Event id:3>...]

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @events.to_json }
    end
  end

  # /events/new => new.html.erb
  def new
    @event = Event.new
  end

  # /events/create => redirect_to index
  def create
    @event = Event.new(event_params)

    if @event.save
      flash[:notice] = "Event is created successfully!"

      redirect_to events_path # /events
    else
      render :action => :new
    end
  end

  # /events/show/:id => show.html.erb
  def show
    respond_to do |format|
      format.html
      format.json { render :json => @event.to_json }
    end
  end

  # /events/edit/:id => edit.html.erb
  def edit
  end

  # /events/update/:id => redirect to show
  def update
    if @event.update(event_params)
      flash[:notice] = "Event is updated successfully!"
      redirect_to event_path(@event) # /events/:id
    else
      render :action => :edit
    end
  end

  # /events/destroy/:id => redirect to index
  def destroy
    @event.destroy

    flash[:alert] = "Event is destroyed!"

    redirect_to events_path # /events
  end

  def latest
    @events = Event.order("id desc").limit(5)
  end

  def bulk_delete
    Event.destroy_all
    flash[:notice] = "Successfully deleted all events!"
    redirect_to events_path
  end

  def bulk_update
    ids = Array(params[:ids])
    events = Event.where(:id => ids)

    events.each do |e|
      e.destroy
    end

    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :category_id, :group_ids => [])
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
