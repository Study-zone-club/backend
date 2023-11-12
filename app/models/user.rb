class User < ApplicationRecord
  has_secure_password
  has_many :tasks
  has_many :subjects
  has_many :schedules
  has_many :notes

  validates :email, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end