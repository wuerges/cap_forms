class CreateCcrs < ActiveRecord::Migration[6.0]
  def change
    create_table :ccrs do |t|
      t.string :name

      t.timestamps
    end
  end
end
