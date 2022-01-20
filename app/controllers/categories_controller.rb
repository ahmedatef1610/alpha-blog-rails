class CategoriesController < ApplicationController
  # before_action :set_category, only: ["show", "edit", "update", "destroy"]
  before_action :set_category, only: [:show, :update, :edit]
  before_action :require_admin, except: [:index, :show, :update, :set_category]

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
    @articles = @category.articles.paginate(page: params[:page], per_page: 5)
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

  def edit
  end

  def update

		if @category.update(category_params)
      flash[:notice] = "category was successfully updated"
      redirect_to @category
    else
      render "edit"
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
