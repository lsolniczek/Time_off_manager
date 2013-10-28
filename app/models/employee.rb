class Employee < ActiveRecord::Base
	before_create :set_holiday_off_limit_used_to_zero
	has_many :time_offs


	def to_s
		"#{self.first_name} #{self.last_name}"
	end


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

	def set_holiday_off_limit_used_to_zero
		self.holiday_off_limit_used = 0
	end

	#AUTHENTICATION
	def self.authentication(email, password)


    	user = find_by("emial = ? AND password = ?", email, password)

    	if user
    		user
    	else
    		nil
    	end
  	end
end
