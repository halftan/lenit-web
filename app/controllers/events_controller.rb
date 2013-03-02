class EventsController < ApplicationController
  def index
    @events = current_user.personal_events.all
  end

  def show
    @event = current_user.personal_events.find(params[:id])
  end

  def new
    @event = current_user.personal_events.new
    @event.owner_id = current_user.id
  end

  def create
    @event = current_user.personal_events.new(params[:event])
    if @event.save
      redirect_to [current_user, @event], :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(params[:event])
      redirect_to [current_user, @event], :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @event = current_user.personal_events.find(params[:id])
    @event.destroy
    redirect_to user_personal_events_url(current_user), :notice => "Successfully destroyed event."
  end
end
