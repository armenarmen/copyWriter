class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :email_id
      t.string :subject
      t.text :body
      t.integer :user_id
      t.integer :score
      t.text :message

      t.timestamps null: false
    end
  end
end
