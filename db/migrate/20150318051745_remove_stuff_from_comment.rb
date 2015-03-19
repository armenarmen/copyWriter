class RemoveStuffFromComment < ActiveRecord::Migration
  def change
  	remove_column :comments, :subject, :string
  	remove_column :comments, :body, :text
  end
end
