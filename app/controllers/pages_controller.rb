class PagesController < ApplicationController
    def home
        
        redirect_to articles_path if logged_in?
        
        @activeInNavbar="home"
    end
    def about
        @activeInNavbar="about"
    end
end
