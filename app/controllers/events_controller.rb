class EventsController < ApplicationController
  
  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user unless @event.attendees.include? current_user
    redirect_to :back, :notice => "Successfully attended the event."
  end
  
  def quit
    @event = Event.find(params[:id])
    if @event.owner == current_user
      redirect_to :back, :alert => t("app.alert.events.host_cannot_quit")
    else
      if @event.attendees.include? current_user
        @event.attendees.delete(current_user) 
        redirect_to :back, :notice => t("app.notice.events.quit_event")
      else
        redirect_to :back, :alert => t("app.alert.events.not_attended")
      end
    end
  end
end
