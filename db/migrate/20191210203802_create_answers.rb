class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :answer_type
      t.string :text
      t.integer :priority
      t.boolean :locked

      t.timestamps
    end
  end
end
