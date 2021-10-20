class PagesController < ApplicationController
    def home
        @activeInNavbar="home"
    end
    def about
        @activeInNavbar="about"
    end
end
