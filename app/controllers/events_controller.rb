class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.hash_data = set_hash_data
    if @event.save
      redirect_to @event
    else
      redirect_to events_new_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to @event
    else
      redirect_to @event
    end
  end

  private

  def set_event
    @event = Event.find_by_id(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :coords, :category, :image, :level_min, :level_max)
  end

  def set_hash_data
    (@event.name + @event.coords + "WDI25").hash
  end

end
