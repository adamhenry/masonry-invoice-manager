class AddClientToJob < ActiveRecord::Migration
  def self.up
    add_column :jobs, :client, :string
  end

  def self.down
    remove_column :jobs, :client
  end
end
