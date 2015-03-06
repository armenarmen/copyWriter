class AddSubjectToEmail < ActiveRecord::Migration
  def change
  	add_column :emails, :subject, :string
    add_column :emails, :body, :text
    add_column :emails, :user_id, :integer
    add_column :emails, :comment, :text
    add_column :emails, :referent_email_id, :integer, default: nil
  end
end
