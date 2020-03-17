class WelcomeController < ApplicationController
  def index
  end

  def welcome
   		redirect_to articles_path if logged_in?
  end 
end
