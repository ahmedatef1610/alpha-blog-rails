class CategoriesController < ApplicationController
  # before_action :set_category, only: ["show", "edit", "update", "destroy"]
  before_action :set_category, only: ["show"]
  before_action :require_admin, except: [:index, :show]

  def new
    @category = Category.new
    @activeInNavbar = "new_category"
  end
  
  def index
    @categories = Category.paginate(page: params[:page], per_page: 5)
    @activeInNavbar = "categories"
  end
  
  def show
    @activeInNavbar = "categories"
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "category was successfully created"
      redirect_to @category
    else
      render "new"
    end
  end




  private

	def category_params
		params.require("category").permit(:name)
	end

  def set_category
    @category = Category.find(params[:id])
  end

  def require_admin
    if !(logged_in? && current_user.admin?)
      flash[:alert] = "Only admins can perform that action"
      redirect_to categories_path
    end
  end

end
