class CreateBlacklists < ActiveRecord::Migration[7.0]
  def change
    create_table :blacklists do |t|
      t.string :jti
      t.datetime :expires_at

      t.timestamps
    end
  end
end
