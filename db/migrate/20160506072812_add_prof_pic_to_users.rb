class AddProfPicToUsers < ActiveRecord::Migration
  def change
    add_column :users, :prof_pic, :string
    add_column :users, :address, :string
    add_column :users, :contact, :integer
  end
end
