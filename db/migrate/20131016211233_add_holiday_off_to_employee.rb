class AddHolidayOffToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :holiday_off_limit, :integer
    add_column :employees, :holiday_off_limit_used, :integer
  end
end
