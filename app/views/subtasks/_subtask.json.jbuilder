json.extract! subtask, :id, :name, :left_of_at, :created_at, :updated_at
json.url subtask_url(subtask, format: :json)
