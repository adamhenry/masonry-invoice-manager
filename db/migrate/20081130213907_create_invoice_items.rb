class CreateInvoiceItems < ActiveRecord::Migration
  def self.up
    create_table :invoice_items do |t|
      t.integer :invoice_id
      t.text :description
      t.string :item_type
      t.decimal :rate, :precision => 10, :scale => 2
      t.decimal :quantity, :precision => 10, :scale => 3
      t.decimal :amount, :precision => 10, :scale => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :invoice_items
  end
end
