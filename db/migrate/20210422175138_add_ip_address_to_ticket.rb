class AddIpAddressToTicket < ActiveRecord::Migration[6.1]
  def change
    add_column :tickets, :ip_address, :string
  end
end
