json.extract! question, :id, :text, :priority, :question_template_id, :question_type, :created_at, :updated_at
json.url question_url(question, format: :json)
