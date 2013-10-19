class AddDayOffToTimeOff < ActiveRecord::Migration
  def change
    add_column :time_offs, :day_off, :integer
  end
end
