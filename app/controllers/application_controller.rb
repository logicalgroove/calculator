class ApplicationController < ActionController::Base
  protected

  def authenticate_user!
    unless current_user
      user = User.create
      session[:current_user_id] = user.id
    end
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by(id: session[:current_user_id])
  end

end
