class SessionsController < ApplicationController
  def new
    # render login form in sessions/new.html.erb
  end

  def create
    # authenticate the user
    # 1. try to find the user by their unique identifier
    # 2. if the user exists -> check if they know their password
    # 3. if they know their password -> login is successful
    # 4. if the user doesn't exist or they don't know their password -> login fails
    @user = User.find_by({"email"=>params["email"]})
    if @user
      if @user["password"] == params["password"]
        flash["notice"] = "You have logged in"
        redirect_to "/companies"
      else
        flash["notice"] = "Unsuccessful login"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful login"
      redirect_to "/sessions/new"
    end
  end

  def destroy
    # logout the user
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
