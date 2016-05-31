class SessionsController < ApplicationController
 	def new
 	end 
	
 	def create
 	  user = User.find_by_email(params[:email])
 	  if user && user.authenticate(params[:password])
 	    session[:user_id] = user.id
 	    redirect_to account_path(current_user.account)
 	  else
 	    redirect_to '/login'
 	  end
 	 end
end
