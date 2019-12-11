class AddNameToReport < ActiveRecord::Migration[6.0]
  def change
    add_column :reports, :name, :string
  end
end
