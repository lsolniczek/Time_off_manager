class AuthenticationController < ApplicationController

	def new
	end

	def create
		login_user = Employee.find_by(:emial=> params[:emial], :password=> params[:password])

		if login_user
			session[:user] = login_user
			redirect_to employees_url
		else
			redirect_to root_url
		end
	end

	def destroy
		if session[:user_id]
			session[:user_id] = nil
			redirect_to root_url
		end
	end
end
