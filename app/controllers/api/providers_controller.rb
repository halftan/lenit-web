class Api::ProvidersController < Api::ApiBaseController

  def index
    @providers = Provider.limit(10).all
  end

  def show
    @provider = Provider.find(params[:id])
  end

end
