class CreateSectors < ActiveRecord::Migration[7.0]
  def change
    create_table :sectors do |t|

      t.string :japanese, null: false
      t.string :english, null: false
      t.string :country, null: false
    end
  end
end
