class AddImageToSpeaker < ActiveRecord::Migration
  def self.up
    change_table :speakers do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :speakers, :image
  end
end
