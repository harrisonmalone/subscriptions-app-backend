class CreateSubscriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :price_per_month
      t.string :billing_date

      t.timestamps
    end
  end
end
