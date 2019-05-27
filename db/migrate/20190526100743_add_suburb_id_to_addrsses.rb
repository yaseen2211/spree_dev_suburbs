class AddSuburbIdToAddrsses < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_addresses, :suburb_id, :integer
    add_index :spree_addresses, :suburb_id
  end
end
