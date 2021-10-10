class ArticlesController < ApplicationController

    def show
        # byebug # to make debugging
        # article = Article.find(params[:id]) # varable . it can't pass to view
        # puts "="*50
        # puts params # {"controller"=>"articles", "action"=>"show", "id"=>"1"}
        # puts params["id"] # 1
        # puts params[:id] # 1
        # puts "="*50
        @article = Article.find(params[:id]) # instance varable . it can pass to view

        
    end
    def index
        @articles = Article.all
    end


    def new
        @article = Article.new
    end


    def create

        # render html: params
        # render plain: params
        # render json: params["article"]
        # render json: params
        
        @article = Article.new(params.require("article").permit("title","description"))

        # render plain: @article
        # render plain: @article.inspect
        # render json: @article

        if @article.save

            flash[:notice] = "Article was created successfully"

            # redirect_to article_path(@article) # prefix_path . prefix in routes so we use prefix_path
            redirect_to @article
        else
            render 'new'
        end


    end

end
