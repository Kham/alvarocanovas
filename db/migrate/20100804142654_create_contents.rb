class CreateContents < ActiveRecord::Migration
  def self.up
    create_table :contents do |t|
      t.string :name
      t.string :label
      t.text :html, :limit => 2000
      t.timestamps
    end
  end

  def self.down
    drop_table :contents
  end
end
