# This file is auto-generated from the current state of the database. Instead 
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your 
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100810151637) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "number"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "type"
  end

  create_table "contents", :force => true do |t|
    t.string   "name"
    t.string   "label"
    t.text     "html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "pictures", :force => true do |t|
    t.string   "title"
    t.integer  "category_id"
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "top",                :default => false
  end

  create_table "videos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "flash_file_file_name"
    t.string   "flash_file_content_type"
    t.integer  "flash_file_file_size"
    t.datetime "flash_file_updated_at"
    t.string   "mp4_file_file_name"
    t.string   "mp4_file_content_type"
    t.integer  "mp4_file_file_size"
    t.datetime "mp4_file_updated_at"
    t.string   "ogg_file_file_name"
    t.string   "ogg_file_content_type"
    t.integer  "ogg_file_file_size"
    t.datetime "ogg_file_updated_at"
    t.string   "image_file_file_name"
    t.string   "image_file_content_type"
    t.integer  "image_file_file_size"
    t.datetime "image_file_updated_at"
    t.string   "source_file_name"
    t.string   "source_content_type"
    t.integer  "source_file_size"
    t.datetime "source_updated_at"
  end

end
