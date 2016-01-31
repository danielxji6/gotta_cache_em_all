class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    loader = Poke::API::Loader.new("pokemon")
    i = 1
    @pokemons = []
    while i <= 151
      found_poke = loader.find(i)
      @pokemons << [found_poke["national_id"], found_poke["name"]]
      p "FOUND THIS POKEMON: #{found_poke['name']}"
      i += 1
    end
  end

  def create
    loader = Poke::API::Loader.new("pokemon")

    poke_number = params[:event][:dex_number]
    selected_poke = loader.find(poke_number)

    categories = []
    selected_poke["types"].each do |type|
      categories << type["name"].capitalize 
    end
    categories = categories.join(", ")

    @event = Event.new(event_params)
    @event.name = selected_poke["name"]
    @event.category = categories
    @event.image = "https://s3-eu-west-1.amazonaws.com/calpaterson-pokemon/#{poke_number}.jpeg"
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
    params.require(:event).permit(:dex_number, :coords, :level_min, :level_max)
  end

  def set_hash_data
    (@event.name + @event.coords + "WDI25").hash
  end

end
