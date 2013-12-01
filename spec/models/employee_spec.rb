require 'spec_helper'
require 'employee'
require 'time_off'
require 'role'

describe Employee do

	context 'invalid employee' do
		it 'ble ble' do 
			employee = Employee.new
			employee.valid?
			employee.errors.count.should == 5
		end
	end

	context 'valid employee' do
		subject(:employee) {Employee.create(first_name: 'Luk', last_name: 'Sol', email: 'luksol@mail.com', 
			holiday_off_limit: 24, password: 'xyz')}

		it {employee.should be_valid}

		it 'holiday off limit used' do 
		  	employee.holiday_off_limit_used.should == 0
		end

		it 'name' do
			employee.to_s.should == 'Luk Sol' 
		end

		context 'holiday off limits' do

			subject(:employee) {Employee.new}
			let(:time_off1) {TimeOff.new(day_off: 5)}
			let(:time_off2) {TimeOff.new(day_off: 10)}

			it 'set' do
				employee.time_offs = [time_off1, time_off2]
				employee.set_holiday_off_limit_used.should == 15
				
			end

			it 'get' do
				employee.time_offs = [time_off1, time_off2]
				employee.set_holiday_off_limit_used
				employee.get_holiday_off_limit_used.should == 15
			end
		end

		it 'role names' do
			role1 = Role.new(role_name: 'admin')
			role2 = Role.new(role_name: 'employee')
			employee.roles = [role1, role2]

			employee.roles_name.should == ['admin', 'employee']
		end
	end
end