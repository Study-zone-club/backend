class Subject < ApplicationRecord
  belongs_to :user

  has_many :notes, dependent: :destroy
  has_many :activities, dependent: :destroy
end
