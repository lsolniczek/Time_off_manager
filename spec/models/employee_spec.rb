require 'spec_helper'
require 'employee'
require 'time_off'
require 'role'

describe Employee do
	it 'holiday off limit used' do 
	  employee = Employee.create

	  employee.holiday_off_limit_used.should == 0
	end
end

describe Employee do
	let(:employee) {Employee.new}
	subject {employee}
	
	it 'name' do
		employee.first_name = 'Luk'
		employee.last_name = 'Sol'

		employee.to_s.should == 'Luk Sol' 
	end

	it 'holiday off limit used' do
		time_off1 = TimeOff.new
		time_off1.day_off = 5
		time_off2 = TimeOff.new
		time_off2.day_off = 10
		employee.time_offs = [time_off1, time_off2]
		employee.set_holiday_off_limit_used
		
		employee.get_holiday_off_limit_used.should == 15
	end

	it 'role names' do
		role1 = Role.new
		role1.role_name = 'admin'
		role2 = Role.new
		role2.role_name = 'employee'
		employee.roles = [role1, role2]

		employee.roles_name.should == ['admin', 'employee']
	end
end