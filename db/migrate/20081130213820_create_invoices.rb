class CreateInvoices < ActiveRecord::Migration
  def self.up
    create_table :invoices do |t|
      t.integer :job_id
      t.integer :invoice_number
      t.string :status
      t.date :due_date
      t.date :paid_date

      t.timestamps
    end
  end

  def self.down
    drop_table :invoices
  end
end
