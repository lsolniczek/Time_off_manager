class AuthenticationController < ApplicationController

	def new
	end

	def create
		redirect_to employees_url
	end

	def destroy
	end

end
