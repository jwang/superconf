class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :body
      t.belongs_to :event
      t.timestamps
    end
  end
end
