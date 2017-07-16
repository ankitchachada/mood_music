json.extract! mood, :id, :input_url, :status, :output_url, :created_at, :updated_at
json.url mood_url(mood, format: :json)
