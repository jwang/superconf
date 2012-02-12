class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.string :year
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
