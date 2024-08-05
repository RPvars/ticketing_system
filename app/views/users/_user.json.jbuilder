json.extract! user, :id, :email, :encrypted_password, :first_name, :last_name, :username, :role, :phone, :receive_email_notifications, :created_at, :updated_at
json.url user_url(user, format: :json)
