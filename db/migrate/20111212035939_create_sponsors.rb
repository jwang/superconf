class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.references :event
      t.references :sponsorship_level
      t.string :name
      t.text :description
      t.string :logo_file_name
      t.string :logo_content_type
      t.integer :logo_file_size
      t.datetime :logo_updated_at

      t.timestamps
    end
    add_index :sponsors, :event_id
    add_index :sponsors, :sponsorship_level_id
  end
end
