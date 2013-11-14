class AddStateToTimeOff < ActiveRecord::Migration
  def change
    add_column :time_offs, :state, :string
  end
end
