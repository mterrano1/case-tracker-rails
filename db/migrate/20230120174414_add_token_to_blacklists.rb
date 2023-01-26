class AddTokenToBlacklists < ActiveRecord::Migration[7.0]
  def change
    add_column :blacklists, :token, :string
  end
end
