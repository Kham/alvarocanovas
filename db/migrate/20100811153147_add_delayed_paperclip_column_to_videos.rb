class AddDelayedPaperclipColumnToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :source_processing, :boolean
  end

  def self.down
  end
end
