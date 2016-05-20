class AddRoleIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :role_id, :integer
  end
end
