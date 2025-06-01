class ApplicationController < ActionController::Base
  before_action :current_user

  def current_user
    puts "----- this code runs at the beginning of the request"
    @current_user = User.find_by({"id"=>session["user_id"]})
    # find logged-in user
  end
end
