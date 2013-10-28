class AuthenticationController < ApplicationController

	def new
	end

	def create
		login_user = Employee.authentication(params[:emial], params[:password])

		if login_user
			session[:user] = login_user
			redirect_to employee_time_offs_url(:employee_id => session[:user].id)
		else
			redirect_to root_url
		end
	end

	def destroy
		if session[:user]
			session[:user] = nil
			redirect_to root_url
		end
	end
end
