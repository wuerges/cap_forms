class CreateFormSubmissions < ActiveRecord::Migration[6.0]
  def change
    create_table :form_submissions do |t|
      t.references :question, null: false, foreign_key: true
      t.references :form_application, null: false, foreign_key: true
      t.references :professor, null: false, foreign_key: true
      t.references :offer, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
