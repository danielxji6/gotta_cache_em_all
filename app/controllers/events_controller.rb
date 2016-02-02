
class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update]

  def index
    @events = Event.all.order('created_at DESC')
  end

  def new
    if admin?
      @event = Event.new
      # loader = Poke::API::Loader.new("pokemon")
      # i = 1
      @pokemons = []
      File.open('./app/assets/data/pokemon.json').each do |line|
        data = JSON.parse(line)
        @pokemons << data
      end
    else
      redirect_to events_path
    end
  end

  def create
    if admin?
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
        data = JSON.parse(line)
        @pokemons << data
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
    params.require(:event).permit(:dex_number, :coords, :level_min, :level_max)
  end

  def set_hash_data
    (@event.name + @event.coords + "WDI25").hash
  end

end
