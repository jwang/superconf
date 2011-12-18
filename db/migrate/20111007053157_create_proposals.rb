class CreateProposals < ActiveRecord::Migration
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
