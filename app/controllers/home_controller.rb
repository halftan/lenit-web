class HomeController < ApplicationController
  def index

    @page_title = I18n.t("app.titles.home")

    if user_signed_in?
      @user = current_user
      @signed_in = true

      @attended_events = @user.attended_events
      @focused_events = @user.followeds.inject([]) do |arr, followed|
        arr + followed.get_all_events
      end

    else
      @user = User.new
      @user.email = nil
      @user.name = nil
    end
  end
end
