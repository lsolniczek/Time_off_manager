class CreateTimeOffs < ActiveRecord::Migration
  def change
    create_table :time_offs do |t|
      t.date :date_from
      t.date :date_to
      t.text :reason
      t.integer :employee_id

      t.timestamps
    end
  end
end
