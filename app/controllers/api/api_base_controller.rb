class Api::ApiBaseController < ActionController::Base
  before_filter :skip_trackable
  respond_to :json

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @message = exception.message
    render 'api/error', :status => :not_found
  end

  protected

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

end
