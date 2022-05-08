class CreateProfitLosses < ActiveRecord::Migration[7.0]
  def change
    create_table :profit_losses do |t|

      t.string :ticker, null: false
      t.string :fiscal_period, null: false
      t.string :net_sales, null: false
      t.string :net_operating_profit, null: false
      t.string :ordinary_profit, null: false
      t.string :net_profit, null: false
      t.string :roe, null: false
    end
  end
end
