class Api::MyEventsController < Api::ApiBaseController
  before_filter :authenticate_user!
  
  def index
    @events = current_user.personal_events
    render 'api/events/index'
  end

  def show
    @event = current_user.personal_events.find(params[:id])
    render 'api/events/show'
  end

  def update
    @event = current_user.personal_events.find(params[:id])
    if @event.update_attributes(params[:event])
      render :json=> {:success=>true, :message=>I18n.t("controller.success")}, :status=>200
    else
      render :json => {:success=>false, :message=>I18n.t("controller.error_param")}, :status=>422
    end
  end
  
end
