class CreatePayments < ActiveRecord::Migration
  def self.up
    create_table :payments do |t|
      t.integer :invoice_id
      t.string :payment_type
      t.integer :check
      t.decimal :amount, :precision => 10, :scale => 2
      t.string :employee_name
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :payments
  end
end
