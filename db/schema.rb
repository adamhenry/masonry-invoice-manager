# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20081209064515) do

  create_table "invoice_items", :force => true do |t|
    t.integer  "invoice_id"
    t.text     "description"
    t.string   "item_type"
    t.decimal  "rate",        :precision => 10, :scale => 2
    t.decimal  "quantity",    :precision => 10, :scale => 3
    t.decimal  "amount",      :precision => 10, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "job_id"
    t.integer  "invoice_number"
    t.string   "status"
    t.date     "due_date"
    t.date     "paid_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "client"
  end

  create_table "payments", :force => true do |t|
    t.integer  "invoice_id"
    t.string   "payment_type"
    t.integer  "check"
    t.decimal  "amount",        :precision => 10, :scale => 2
    t.string   "employee_name"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

end
