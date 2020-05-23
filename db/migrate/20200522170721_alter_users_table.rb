class AlterUsersTable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :type, :string
    add_column :users, :api_token, :string
  end
end
