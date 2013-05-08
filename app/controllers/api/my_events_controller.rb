class Api::MyEventsController < Api::ApiBaseController
  before_filter :authenticate_user!
  respond_to :json
  
  def index
    @events = current_user.personal_events
  end

  def show
    @event = PersonalEvent.find(params[:id])
  end

  def update
    if @event.blank?
      @event = PersonalEvent.find(params[:id])
    if @event.update_attributes(params[:event])
      render :json=> {:success=>true, :message=>I18n.t("controller.success")}, :status=>200
    else
      render :json => {:success=>false, :message=>I18n.t("controller.error_param")}, :status=>422
    end
  end

  def 

end
