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

end
