module ApplicationHelper
	def current_user(user_id)
		Employee.find(user_id)
	end

	def access_to (user_id, *roles)
		loged_user = Employee.find(user_id)
		
		roles.map(&:to_s).any? { |r| loged_user.roles_name.include?(r)}
		
	end
end
