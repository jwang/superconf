class AddFieldsToProposals < ActiveRecord::Migration
  def change
    add_column :proposals, :first_name, :string
    add_column :proposals, :last_name, :string
    add_column :proposals, :email, :string
    add_column :proposals, :location, :string
    add_column :proposals, :bio, :text
    add_column :proposals, :links, :string
    add_column :proposals, :github, :string
    add_column :proposals, :twitter, :string
    add_column :proposals, :speaker_cv, :text
    add_column :proposals, :video_links, :text
    add_column :proposals, :notes, :text
    add_column :proposals, :new_talk, :text
  end
end
