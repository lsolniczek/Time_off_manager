require 'spec_helper'
require 'time_off'
require 'employee'

describe TimeOff do
	
	let(:employee) {Employee.create(first_name: 'Luk', last_name: 'Sol', email: 'luksol@mail.com', 
			holiday_off_limit: 24, holiday_off_limit_used: 18, password: 'xyz')}
	subject(:time_off) {employee.time_offs.create(date_from: "2011-11-20", date_to: "2011-11-30", reason: 'xyz')}

	context 'day off' do

	    it 'set' do
	    	time_off.set_day_off.should == 10
	    end

	    it 'get' do
	    	time_off.set_day_off
	    	time_off.get_day_off.should == 10
	    end
	end

	context 'state machine state' do

		it 'initial state' do
			time_off.state.should == 'new'
		end

		it 'go to in_approval state' do
			time_off.change!
			time_off.state.should == 'in_approval'
		end

		it 'go to accepted state' do
			time_off.change!
			time_off.approve!
			time_off.state.should == 'accepted'
		end

		it 'go to rejected state' do
			time_off.change!
			time_off.reject!
			time_off.state.should == 'rejected'
		end

		it 'go to cancel state from new' do
			time_off.cancel!
			time_off.state.should == 'canceled'
		end

		it 'go to cancel state from rejected' do
			time_off.change!
			time_off.reject!
			time_off.cancel!
			time_off.state.should == 'canceled'
		end

		it 'go to cancel state from accepted' do
			time_off.change!
			time_off.approve!
			time_off.cancel!
			time_off.state.should == 'canceled'
		end
	end
end
