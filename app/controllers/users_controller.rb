class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_page_title

  def follow
    authorize! :follow, current_user, :message => "You are editing other user's profile!"
    @user = User.find(params[:id])
    follow = User.find(params[:follows])
    unless @user.followed_ids.include? params[:follows].to_i
      @user.follow! follow
      flash[:notice] = "Successfully followed #{view_context.link_to follow.name, user_path(follow)}!".html_safe
    else
      flash[:notice] = "You are not able to follow this user."
    end
    redirect_to :back
  end

  def unfollow
    authorize! :unfollow, current_user, :message => "You are editing other user's profile!"
    @user = User.find(params[:id])
    follow = User.find(params[:follows])
    if @user.followed_ids.include? params[:follows].to_i
      @user.unfollow! follow
      flash[:notice] = "Successfully unfollowed #{view_context.link_to follow.name, user_path(follow)}!".html_safe
    else
      flash[:notice] = "You are not following this user."
    end
      redirect_to :back
  end

  def followed
    @page_title = I18n.t"app.titles.followed"
    unless user_signed_in?
      redirect_to new_user_session_path, :notice => "To proceed you need to sign in."
    else
      @followeds = current_user.followeds.all
    end
  end

  def follower
    @page_title = I18n.t"app.titles.follower"
    unless user_signed_in?
      redirect_to new_user_session_path, :notice => "To proceed you need to sign in."
    else
      @followers = current_user.followeds.all
    end
  end


  def index
    authorize! :index, current_user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    authorize! :show, current_user, :message => "You are not authorized to this page!"
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, current_user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    authorize! :destroy, current_user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  protected
  def helpers
    ActionController::Base.helpers
  end
  
  def set_page_title
    @page_title = I18n.t"app.titles.users"
  end
end