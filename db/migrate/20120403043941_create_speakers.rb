class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.belongs_to :event
      t.string :name
      t.string :company
      t.string :session
      t.text :bio
      t.string :twitter
      t.string :github
      t.string :website
      t.integer :order

      t.timestamps
    end
  end
end
