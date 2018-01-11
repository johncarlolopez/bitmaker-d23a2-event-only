class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    # @event.name = params[:event][:name]
    # @event.date = params[:event][:date]
    # @event.capacity = params[:event][:capacity]
    # @event.city = params[:event][:city]

    if @event.save
      redirect_to event_url(@event)
    else
      redirect_to event_url(@event)
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    # @event.name = params[:event][:name]
    # date_selected = params[:event][:'date(1i)'] + params[:event][:'date(2i)'] + params[:event][:'date(3i)']
    # @event.date = params[:event][:date]
    # @event.date = date_selected.to_datetime
    # @event.date
    # @event.capacity = params[:event][:capacity]
    # @event.city = params[:event][:city]

    if @event.save
      redirect_to events_url
    else
      redirect_to new_event_url
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  def event_params
    params.require(:event).permit(:name, :date, :capacity, :city)
  end

end
