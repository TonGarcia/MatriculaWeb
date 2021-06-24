json.extract! subscription, :id, :access_type, :user_id, :subject_id, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
