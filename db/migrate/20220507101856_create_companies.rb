class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|

      t.string :ticker, null: false
      t.string :japanese
      t.string :english
      t.string :country, null: false
      t.string :market
      t.string :sector_id, null: false
      t.string :fiscal_period
      t.text :japanese_description
      t.text :english_description
    end
  end
end
