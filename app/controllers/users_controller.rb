class UsersController < ApplicationController
  def new
    @activeInNavbar = "new_user"
    @user = User.new
  end

  ####################################################################################################
  def create
    @user = User.new(params.require("user").permit("username","email","password"))
    if @user.save
      flash[:notice] = "User was created successfully"
      redirect_to @user
    else
      render "new"
    end
  end

  ####################################################################################################
end
