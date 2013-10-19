class RemoveDayOffFromTimeOff < ActiveRecord::Migration
  def change
  	remove_column :time_offs, :day_off
  end
end
