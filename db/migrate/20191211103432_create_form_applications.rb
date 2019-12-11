class CreateFormApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :form_applications do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :form_template, null: false, foreign_key: true

      t.timestamps
    end
  end
end
