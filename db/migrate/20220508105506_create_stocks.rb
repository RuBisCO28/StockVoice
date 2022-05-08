class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|

      t.string :ticker, null: false
      t.string :trade_date, null: false
      t.integer :open, null: false
      t.integer :high, null: false
      t.integer :low, null: false
      t.integer :close, null: false
      t.integer :volume, null: false
    end
  end
end
