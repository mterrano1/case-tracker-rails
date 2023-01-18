class CreateCaseAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :case_assignments do |t|
      t.integer :assigned_case_id
      t.integer :assigned_employee_id

      t.timestamps
    end
  end
end
