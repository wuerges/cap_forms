class CreateFormTemplateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :form_templates, :questions do |t|
      # t.index [:form_template_id, :question_id]
      t.index [:question_id, :form_template_id], :name => :form_template_question_index
    end
  end
end
