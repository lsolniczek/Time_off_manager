class TimeOff < ActiveRecord::Base
	
	validate :do_we_have_limit
	before_save :set_day_off
	after_save :employee_set_holiday_off_used 
	after_destroy :employee_set_holiday_off_used 

	belongs_to :employee
	


	#setter and getter to day_off
	def set_day_off
		self.day_off = (self.date_to - self.date_from).to_i
	end

	def get_day_off
		day_off
	end

	#set employee holiday off used 
	def employee_set_holiday_off_used
		employee = self.employee
		employee.set_holiday_off_limit_used
		employee.save
	end

	#VALIDATORS
	#check if we can take that long vacation
	def do_we_have_limit
		days_off_used = self.employee.get_holiday_off_limit_used
		days_off_limit = self.employee.holiday_off_limit

		new_days_off_used = days_off_used + self.set_day_off

		if days_off_limit < new_days_off_used
			errors.add(:time_off_limit_overstep, ", change it!")
		end
	end
end
