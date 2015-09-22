class UsersController < ApplicationController

  include SessionsHelper

  def new
    @user = User.new
  end

  def create
    @account = Account.new(name: params[:user].delete(:account))	
    @user = User.new user_params
    @user.account_id = @account.id


    if @account.save && @user.save
	log_in @user
	flash[:notice] = 'Great. You have successfully signed up!'
    	redirect_to root_path
    else
	flash.now[:danger] = 'Sorry. Some errors prevented the sign-up process from completing'
	render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :first_name, :last_name, :password, :password_confirmation)
  end
end
