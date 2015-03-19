class AddCharBeganAtCharEndedAtToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :char_began_at, :integer
  	add_column :comments, :char_ended_at, :integer
  end
end
