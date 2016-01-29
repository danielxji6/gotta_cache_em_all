class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    event_params = params.require(:event).permit(:name, :cords, :type, :image)
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event
    else
      redirect_to events_new_path
    end
  end

  def show
    @event = Event.find_by_id(params[:id])
  end

end
