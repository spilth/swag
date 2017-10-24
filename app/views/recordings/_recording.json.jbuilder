json.extract! recording, :id, :description, :user_id, :song_id, :created_at, :updated_at
json.url recording_url(recording, format: :json)
