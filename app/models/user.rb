class User < ApplicationRecord
  has_secure_password
  has_many :tasks, dependent: :destroy
  has_many :subjects, dependent: :destroy
  has_many :schedules, dependent: :destroy
  has_many :notes, dependent: :destroy
  has_many :activities, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }
end