json.extract! answer, :id, :answer_type, :text, :priority, :locked, :created_at, :updated_at
json.url answer_url(answer, format: :json)
