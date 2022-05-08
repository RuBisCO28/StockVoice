class CreateCashflows < ActiveRecord::Migration[7.0]
  def change
    create_table :cashflows do |t|

      t.string :ticker, null: false
      t.string :fiscal_period, null: false
      t.string :cfo, null: false
      t.string :cfi, null: false
      t.string :cff, null: false
    end
  end
end
