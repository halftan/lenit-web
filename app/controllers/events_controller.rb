class EventsController < ApplicationController
  
  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user unless @event.attendees.include? current_user
    redirect_to :back, :notice => "Successfully attended the event."
  end
  
  def quit
    @event = Event.find(params[:id])
    @event.attendees.delete(current_user) if @event.attendees.include? current_user
    redirect_to :back, :notice => "Successfully quit the event."
  end
end
