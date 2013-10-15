class TimeOff < ActiveRecord::Base
	belongs_to :employee



	def time_off_in_days
		(self.date_to - self.date_from).to_i
	end
end
