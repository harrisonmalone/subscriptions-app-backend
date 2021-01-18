class RenameBillingPerMonthToBillingPeriod < ActiveRecord::Migration[6.0]
  def change
    rename_column :subscriptions, :billing_date, :billing_period
  end
end
