class Api::ApiBaseController < ActionController::Base
  before_filter :skip_trackable
  respond_to :json

  def skip_trackable
    request.env['devise.skip_trackable'] = true
  end

end
