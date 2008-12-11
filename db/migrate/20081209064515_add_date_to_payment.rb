class AddDateToPayment < ActiveRecord::Migration
  def self.up
    add_column :payments, :date, :date
  end

  def self.down
    remove_column :payments, :date
  end
end
