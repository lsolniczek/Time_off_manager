class Employee < ActiveRecord::Base
	has_many :time_offs



	#setter and getter to holiday_off_limit_used
	def set_holiday_off_limit_used
		days_off_limit = 0

		self.time_offs.each do | days |
			days_off_limit = days_off_limit + days.get_day_off
		end

		self.holiday_off_limit_used = days_off_limit
	end

	def get_holiday_off_limit_used
		holiday_off_limit_used
	end
end
