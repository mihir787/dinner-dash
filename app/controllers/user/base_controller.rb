class User::BaseController < ApplicationController
  before_action :require_authenicated_user

  def require_authenicated_user
    render "/../../public/404" unless logged_in?
  end
end