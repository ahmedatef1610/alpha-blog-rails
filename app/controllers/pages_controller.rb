class PagesController < ApplicationController
    def home
        @activeInNavber="home"
    end
    def about
        @activeInNavber="about"
    end
end
