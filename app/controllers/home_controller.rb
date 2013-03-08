class HomeController < ApplicationController
  def index
    flash.keep
    if user_signed_in?
      @user = current_user
      @events = Event.limit(10).order("created_at DESC")
      @signed_in = true
    else
      @user = User.new
      @user.email = nil
      @user.name = nil
    end
  end
end
