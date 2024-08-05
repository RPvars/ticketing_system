json.extract! ticket, :id, :requester_name, :requester_email, :requester_phone, :requester_type, :problem_title, :problem_description, :link, :language, :assignee_id, :app_id, :related_ticket_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
