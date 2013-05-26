class HomeController < ApplicationController
  def index

    @page_title = I18n.t("app.titles.home")

    if user_signed_in?
      @user = current_user
      @signed_in = true

      @attended_events = @user.events
      @focused_events = @user.followeds.inject([]) do |arr, followed|
        arr + fol.get_all_events
      end

      # # TODO: make this AJAX
      # if @user.followeds.present?
      #   if params[:filter] == "attended"
      #     @events = @user.events
      #   else # params[:filter] == "followed"
      #     @events = @user.followeds.inject([]) do |arr, fol|
      #       arr + fol.get_all_events
      #     end
      #   end
      # else # show all events
      #   @events = Event.limit(10).order("created_at DESC")
      # end
    else
      @user = User.new
      @user.email = nil
      @user.name = nil
    end
  end
end
