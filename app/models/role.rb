class Role < ActiveRecord::Base
	has_many :employee_roles
	has_many :employees, :through => :employee_roles
	

	def to_s
		"#{self.role_name}"
	end
	
end
