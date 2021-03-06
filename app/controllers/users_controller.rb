class UsersController < ApplicationController
	skip_before_filter :authorize
	def index
		@user = User.new
		@paystubs = Paystub.all
	end

	def show
		@paystubs = Paystub.all
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to new_path
		else
			render "new"
		end
	end

	
	private 
	def user_params
		params.require(:user).permit(:first_name, :last_name, :investment_strategy, :health_insurance, :email, :password, :password_confirmation)
	end


end