class EmployeeRole < ActiveRecord::Base
	belongs_to :role
	belongs_to :employee
end
