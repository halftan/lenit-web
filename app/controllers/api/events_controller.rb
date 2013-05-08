class Api::EventsController < Api::ApiBaseController

  def index
    @events = Event.limit(10).all
  end

  def show
    @event = Event.find(params[:id])
  end

end
