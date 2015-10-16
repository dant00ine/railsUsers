class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
	end

	def create
		@user = User.new(user_params)
		if @user.valid?
			@user.save
			flash[:success] = "successfully wrote user to database"
			redirect_to "/users"
		else
			flash[:errors] = @user.errors.full_messages
			redirect_to "/users/new"
		end
	end

	def show
		# puts "USER PARAMS HERE***********", user_params
		@user = User.find(params[:id])
		puts @user
		render "show"
	end

	def edit
		@user = User.find(params[:id])
		render "edit"
	end

	def update
		# User.update(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], password: user_params[:password])
		User.find(params[:id]).update(user_params)
		redirect_to '/users'
	end

	def destroy
		User.find(params[:id]).destroy
		redirect_to '/users'
	end

	def user_params
		params.permit(:first_name, :last_name, :email, :password)
	end
end
