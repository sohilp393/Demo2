class SessionsController < ApplicationController
	def new
		
	end

	def create 
	  user = User.find_by(email:params[:session][:email].downcase)
	  
	  if user && user.authenticate(params[:session][:password])
		flash[:success] = "Welcome to the alpha blog #{user.username}"
	  	session[:user_id] = user.id
	  	redirect_to user_path(user)
	  else
			flash[:success] = "Something was wrong"
	  		render 'new'		
	  end
	end

	def destroy
		session[:user_id] = nil
		redirect_to	root_path
	end
end