class AddTextToFormSubmission < ActiveRecord::Migration[6.0]
  def change
    add_column :form_submissions, :text, :text
  end
end
