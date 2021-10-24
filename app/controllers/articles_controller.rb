class ArticlesController < ApplicationController
  before_action :set_article, only: ["show", "edit", "update", "destroy"]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
    # byebug # to make debugging
    # article = Article.find(params[:id]) # variable . it can't pass to view
    # puts "="*50
    # puts params # {"controller"=>"articles", "action"=>"show", "id"=>"1"}
    # puts params["id"] # 1
    # puts params[:id] # 1
    # puts "="*50
    
    # @article = Article.find(params[:id]) # instance variable . it can pass to view
   
    

  end

  ####################################################################################################
  def index
    # @articles = Article.all
    @articles = Article.paginate(page: params[:page], per_page: 5)
    @activeInNavbar = "articles"
  end

  ####################################################################################################
  def new
    @article = Article.new
    @activeInNavbar = "new_article"
  end

  ####################################################################################################
  def create

    # render html: params
    # render plain: params
    # render json: params["article"]
    # render json: params

    # @article = Article.new(params.require("article").permit("title","description"))
    @article = Article.new(article_params)
    # @article.user = User.first
    @article.user = current_user

    # render plain: @article
    # render plain: @article.inspect
    # render json: @article

    if @article.save
      flash[:notice] = "Article was created successfully"

      # redirect_to article_path(@article) # prefix_path . prefix in routes so we use prefix_path
      redirect_to @article
    else
      render "new"
    end
  end

  ####################################################################################################
  def edit
    # @article = Article.find(params["id"])
  end

  ####################################################################################################
  def update
    # @article = Article.find(params["id"])

    # if @article.update(params.require("article").permit("title","description"))
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render "edit"
    end
  end

  ####################################################################################################
  def destroy
    # @article = Article.find(params["id"])
    @article.destroy
    redirect_to articles_path
  end

  ####################################################################################################
  private

  def set_article
    @article = Article.find(params["id"])
  end

  def article_params
    params.require("article").permit("title", "description")
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
  ####################################################################################################

end
