class AddExpandedAddressToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :city, :string
    add_column :jobs, :state, :string
    add_column :jobs, :zipcode, :integer
  end

  def self.down
    remove_column :jobs, :zipcode
    remove_column :jobs, :state
    remove_column :jobs, :city
  end
end
