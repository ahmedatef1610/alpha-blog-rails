class UsersController < ApplicationController
  def new
    @activeInNavbar = "users"
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
		@activeInNavbar = "users"
		@users = User.all
	end
	####################################################################################################
	def edit
    @user = User.find(params["id"])
  end
	####################################################################################################
	def update
    @user = User.find(params["id"])
		if @user.update(user_params)
      flash[:notice] = "Your account information was successfully updated"
      # redirect_to @user
      redirect_to articles_path
    else
      render "edit"
    end
  end
	####################################################################################################
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end
	####################################################################################################
	private
	def user_params
		params.require("user").permit("username","email","password")
	end
	####################################################################################################
end
