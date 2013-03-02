class PersonalEventsController < ApplicationController
  load_and_authorize_resource :user
  load_and_authorize_resource :through => :user
  def index
  end

  def show
  end

  def new
    @personal_event.owner_id = current_user.id if @personal_event.owner_id != current_user.id
  end

  def create
    if @personal_event.save
      redirect_to [current_user, @personal_event], :notice => "Successfully created event."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @personal_event.update_attributes(params[:personal_event])
      redirect_to [current_user, @personal_event], :notice  => "Successfully updated event."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @personal_event.destroy
    redirect_to user_personal_events_url(current_user), :notice => "Successfully destroyed event."
  end
end
