class AddStateToSpreeMollieCheckouts < ActiveRecord::Migration
  def change
    add_column :spree_mollie_checkouts, :state, :string, :default => "complete"
  end
end
