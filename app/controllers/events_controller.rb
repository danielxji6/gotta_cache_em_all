
class EventsController < ApplicationController
  before_action :logged_in?, :set_event, only: [:show, :edit, :update]

  def index
    @events = Event.all.order('created_at DESC') #newest event (pokemon) first
    current_user
  end

  def new
    if admin? #checks for admin
      @event = Event.new
      @pokemons = []
      File.open('./app/assets/data/pokemon.json').each do |line|
        data = JSON.parse(line) #opens file and parses to return in JSON
        @pokemons << data # push to instance variable
      end
    else
      redirect_to events_path
    end
  end

  def create
    if admin?
        loader = Poke::API::Loader.new("pokemon") #load the api
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
        @event.hash_data = set_hash_data #adds hash data to instance variable
      if @event.save
        redirect_to @event
      else
        redirect_to events_new_path
      end
    else
      flash[:error] = "Not authorized"
      redirect_to events_path
    end
  end

  def show
    if admin?
      render :show
    else
      render :show_trainer
    end
  end

  def edit
    if admin?
      @pokemons = []
      File.open('./app/assets/data/pokemon.json').each do |line|
        data = JSON.parse(line) #parse file line by line into JSON
        @pokemons << data #push to instance variable
      end
    else
      redirect_to events_path
    end
  end

  def update
    if admin? && @event.update(event_params)
      flash[:notice] = "Updated event."
      redirect_to @event
    else
      flash[:error] = "Failed"
      redirect_to event_path(@event)
    end
  end

  private

  def set_event
    @event = Event.find_by_id(params[:id])
  end

  def event_params
    params.require(:event).permit(:dex_number, :coords, :level_min, :level_max, :description)
  end

  def set_hash_data #takes pokemon name and the coordinates and the string to make a hash
    (@event.name + @event.coords + "WDI25").hash
  end

end
