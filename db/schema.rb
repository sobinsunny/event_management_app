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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_161_001_052_941) do
  create_table 'events', force: :cascade do |t|
    t.string   'title'
    t.text     'location'
    t.integer  'entry_fee'
    t.datetime 'event_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'user_events', force: :cascade do |t|
    t.integer  'event_id'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['event_id'], name: 'index_user_events_on_event_id'
    t.index ['user_id'], name: 'index_user_events_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.string   'email'
    t.string   'password_hash'
    t.string   'password_salt'
    t.integer  'gender'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
  end
end
