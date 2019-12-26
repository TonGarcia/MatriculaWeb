json.extract! subject, :id, :name, :description, :workload, :online_link, :class_schedule, :user_id, :created_at, :updated_at
json.url subject_url(subject, format: :json)
