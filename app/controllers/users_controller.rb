class UsersController < ApplicationController
  def new
    @activeInNavbar = "new_user"
    @user = User.new
  end

  ####################################################################################################
  def create
		# byebug
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the Alpha Blog #{@user.username}, you have successfully signed up"
      # redirect_to @user
      redirect_to articles_path
    else
      render "new"
    end
  end
  ####################################################################################################
	def index
		redirect_to signup_path
	end
	####################################################################################################
	private
	def user_params
		params.require("user").permit("username","email","password")
	end
	####################################################################################################
end
