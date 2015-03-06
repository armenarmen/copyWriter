class AddEmailToUser < ActiveRecord::Migration
  def change
  	add_column :users, :full_name, :string
  	add_column :users, :email, :string
  	add_column :users, :karma, :integer
  	add_column :users, :admin, :boolean, :default => false
  end
end
