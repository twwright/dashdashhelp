class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def current_user
    super || Guest.new # if current_user from Clearance returns nil, generate null object ("Guest")
  end

  def not_found
    redirect_to root_path
  end
end
