class CreateQuestionTemplates < ActiveRecord::Migration[6.0]
  def change
    create_table :question_templates do |t|
      t.string :name
      t.boolean :locked

      t.timestamps
    end

    create_table :question_templates_anwers, id: false do |t|
      t.belongs_to :question_template
      t.belongs_to :answer

      t.timestamps
    end
  end
end
