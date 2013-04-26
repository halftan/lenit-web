class Api::MyProvidersController < Api::ApiBaseController
  before_filter :authenticate_user!
  respond_to :json
  
  # before_filter :ensure_params_exist

  def index
    @providers = current_user.providers
  end

  def show
    @provider = Provider.find(params[:id])
  end

  def update
    if @provider.update_attributes(params[:provider])
      render :json=> {:success=>true, :message=>I18n.t("controller.success")}, :status=>200
    else
      render :json => {:success=>false, :message=>I18n.t("controller.error_param")}, :status=>422
    end
  end
  # protected
  # def ensure_params_exist
  #   return unless params[:login_token].blank?
  #   render :json=>{:success=>false, :message=>I18n.t("controller.missing_param")}, :status=>422
  # end
end