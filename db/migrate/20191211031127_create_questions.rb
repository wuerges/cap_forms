class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :text
      t.integer :priority
      t.references :question_template, null: false, foreign_key: true
      t.integer :question_type

      t.timestamps
    end
  end
end
