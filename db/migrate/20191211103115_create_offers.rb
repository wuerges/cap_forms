class CreateOffers < ActiveRecord::Migration[6.0]
  def change
    create_table :offers do |t|
      t.references :ccr, null: false, foreign_key: true
      t.references :major, null: false, foreign_key: true

      t.timestamps
    end
  end
end
