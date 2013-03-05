class ProvidersController < ApplicationController
  load_and_authorize_resource :user, :except => [:all, :show]
  load_and_authorize_resource :through => :user, :except => [:all, :show]
  rescue_from "ActiveRecord::RecordNotFound" do |ex|
    redirect_to root_url, :alert => 'You are not authorized to this page.'
  end
  
  def index
  end
  
  def show
    @provider = Provider.find(params[:id])
  end
  
  def new
  end
  
  def all
    @providers = Provider.order("updated_at DESC")
    render :index
  end
  
  def create
    if @provider.save
      redirect_to [current_user, @provider], :notice => "Successfully registered provider."
    else
      render :action => 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @provider.update_attributes(params[:provider])
      redirect_to [current_user, @provider], :notice  => "Successfully updated your provider."
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @provider.destroy
    redirect_to current_user, :notice => "Successfully unregistered your provider."
  end
  
  protected
  
end