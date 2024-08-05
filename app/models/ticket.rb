class Ticket < ApplicationRecord
  # Associations
  belongs_to :assignee, class_name: 'User', optional: true
  belongs_to :app
  belongs_to :related_ticket, class_name: 'Ticket', optional: true

  # Validations
  validates :requester_name, presence: true
  validates :requester_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :requester_phone, presence: true
  validates :requester_type, presence: true
  validates :problem_title, presence: true
  validates :problem_description, presence: true
  validates :language, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  # Enums
  enum requester_type: { employee: 0, client_responsible: 1, specialist: 2, administrator: 3 }
  enum language: { lv: 0, en: 1, ru: 2 }
  enum status: { open: 0, in_progress: 1, closed: 2 }
  enum priority: { low: 0, medium: 1, high: 2 }

  # Tagging (if you plan to use the acts-as-taggable-on gem)
  acts_as_taggable_on :tags

  # Attachments (if you plan to use ActiveStorage for file attachments)
  has_many_attached :files
end
