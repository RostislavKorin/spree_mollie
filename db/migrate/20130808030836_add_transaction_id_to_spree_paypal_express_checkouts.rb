class AddTransactionIdToSpreeMollieCheckouts < ActiveRecord::Migration
  def change
    add_column :spree_mollie_checkouts, :transaction_id, :string
    add_index :spree_mollie_checkouts, :transaction_id
  end
end
