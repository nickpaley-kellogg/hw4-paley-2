class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new
    @user.first_name = params["first_name"]
    @user.last_name = params["last_name"]
    @user.email = params["email"]
    @user.password = params["password"]
    
    if @user.save
      redirect_to "/sessions/new"
    else
      flash[:error] = "Error: #{@user.errors.full_messages.join(", ")}"
      redirect_to "/users/new"
    end
  end
end