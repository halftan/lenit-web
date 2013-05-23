class Api::SessionsController < Api::ApiBaseController
  # before_filter :authenticate_user!, :except => [:create, :destroy]
  before_filter :ensure_params_exist, :except => :validate
  respond_to :json

  def create
    user = User.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless user

    if user.valid_password?(params[:password])
      sign_in(:user, user)
      user.ensure_authentication_token!
      request_successful(
        :auth_token=>user.authentication_token,
        :email=>user.email,
        :username=>user.name)
      return
    end
    invalid_login_attempt
  end

  def destroy
    user = User.find_for_database_authentication(:email => params[:email])
    return invalid_login_attempt unless user

    sign_out(user)
    user.authentication_token = nil
    user.save
    request_successful
  end
  
  def validate
    if params[:auth_token].blank?
      request_failed and return
    end
    user = User.find_by_authentication_token params[:auth_token]
    if user.blank?
      request_failed
    else
      request_successful(
        :auth_token=>user.authentication_token,
        :email=>user.email,
        :username=>user.name)
    end
  end

  protected
  def ensure_params_exist
    return if params[:email].present? or params[:password].present?
    request_failed :message=>I18n.t("controller.missing_param")
  end

  def request_failed options={}
    render :json => {:success=>false}.merge(options.except :status), :status => options[:status] || :bad_request
  end

  def request_successful options={}
    render :json => {:success=>true}.merge(options.except :status), :status => options[:status] || :ok    
  end

  def invalid_login_attempt
    request_failed(
      :message=>I18n.t("controller.error_login"),
      :status => :unauthorized)
  end

end
