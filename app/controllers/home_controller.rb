class HomeController < ApplicationController
  def index

    @page_title = I18n.t("app.titles.home")

    if user_signed_in?
      @user = current_user
      @signed_in = true

      @attended_events = @user.attended_events.available
      @focused_events = @user.get_focused_events

    else
      @user = User.new
      @user.email = nil
      @user.name = nil
    end
  end
end
