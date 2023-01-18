class CreateCases < ActiveRecord::Migration[7.0]
  def change
    create_table :cases do |t|
      t.string :allegation_type
      t.string :allegation
      t.string :department
      t.string :status
      t.string :resolution
      t.integer :customer_id

      t.timestamps
    end
  end
end
