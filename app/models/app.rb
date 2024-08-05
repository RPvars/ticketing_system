class App < ApplicationRecord
  # Associations
  has_many :tickets
  has_many :app_users
  has_many :users, through: :app_users

  # Validations
  validates :domain, presence: true, uniqueness: true
  validates :user_name, presence: true
  validates :company_name, presence: true
  validates :work_hours, presence: true
end
