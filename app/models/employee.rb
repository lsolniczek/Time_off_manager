class Employee < ActiveRecord::Base
	has_many :time_offs
end
