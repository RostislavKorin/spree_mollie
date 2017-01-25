class RenamePaymentMethods < ActiveRecord::Migration
  def up
    execute <<-SQL
      update spree_payment_methods set type = 'Spree::Gateway::Mollie' WHERE type = 'Spree::BillingIntegration::Mollie'
    SQL
  end

  def down
    execute <<-SQL
      update spree_payment_methods set type = 'Spree::BillingIntegration::Mollie' WHERE type = 'Spree::Gateway::Mollie'
    SQL
  end
end
