class CreateSponsorshipLevels < ActiveRecord::Migration
  def change
    create_table :sponsorship_levels do |t|
      t.references :event
      t.string :name
      t.string :status
      t.integer :maximum
      t.text :description

      t.timestamps
    end
    add_index :sponsorship_levels, :event_id
  end
end
