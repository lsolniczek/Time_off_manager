class CreateEmployeeRoles < ActiveRecord::Migration
  def change
    create_table :employee_roles do |t|
      t.integer :employee_id
      t.integer :role_id

      t.timestamps
    end
  end
end
