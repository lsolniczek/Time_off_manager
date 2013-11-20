class AuthenticationController < ApplicationController
	before_action :are_you_login?, only: [:new]


	def new
	end

	def create
		login_user = Employee.authentication(params[:email], params[:password])

		if login_user
			session[:user_id] = login_user.id
			redirect_to employee_time_offs_url(:employee_id => session[:user_id])
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

	private
	def are_you_login?
		if session[:user_id]
			redirect_to employee_time_offs_url(:employee_id => session[:user_id])
		end
	end
end
