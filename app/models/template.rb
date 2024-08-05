class Template < ApplicationRecord
  # Enums for type and target
  enum template_type: { email: 0, other_type: 1 }
  enum target: { ticket_auto_reply: 0, ticket_progress_changes: 1, ticket_closed: 2, feedback_email: 3 }

  # Validations
  validates :template_type, presence: true, inclusion: { in: template_types.keys }
  validates :name, presence: true
  validates :content, presence: true
  validates :target, presence: true, inclusion: { in: targets.keys }
end
