class User < ApplicationRecord
  belongs_to :user_group, optional: true

  # Devise modules
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :lockable, :timeoutable

  # Enums
  enum role: { administrator: 0, user: 1 }

  # Validations
  validates :first_name, :last_name, :username, :email, :phone, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, format: { with: /\A\+?[\d\s\-()]{10,20}\z/, message: "must be a valid phone number" }
  validates :role, presence: true
  validates :avatar, content_type: ['image/png', 'image/jpg', 'image/jpeg'],
  size: { less_than: 5.megabytes , message: 'is not given between size' }
  

  # Associations (add if necessary)
  has_many :app_users
  has_many :apps, through: :app_users
  has_many :assigned_tickets, class_name: 'Ticket', foreign_key: 'assignee_id'

  # Avatar upload (if using ActiveStorage)
  has_one_attached :avatar

  # Default values
  after_initialize :set_default_role, if: :new_record?


  def administrator?
    role == "administrator"
  end

  private

  def set_default_role
    self.role ||= :user
  end
end
