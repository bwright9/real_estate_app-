class UsersController < ApplicationController

	def new
	end

  def create
  user = User.new(user_params) 
  if user.save
    session[:user_id] = user.id
    redirect_to account_path(current_user.account)
  else
    render :new
  end
 end
end
