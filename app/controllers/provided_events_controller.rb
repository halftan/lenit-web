class ProvidedEventsController < ApplicationController
  load_and_authorize_resource :provider
  load_and_authorize_resource :through => :provider
  def index
  end

  def show
  end

  def new
    @provided_event.owner_id = current_user.id if @provided_event.owner_id != current_user.id
  end

  def create
    if @provided_event.save
      redirect_to [@provider, @provided_event], :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @provided_event.update_attributes(params[:provided_event])
      redirect_to [@provider, @provided_event], :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @provided_event.destroy
    redirect_to provider_provided_events_url(@provider), :notice => "Successfully destroyed event."
  end
end
