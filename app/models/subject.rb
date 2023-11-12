class Subject < ApplicationRecord
  belongs_to :user

  has_many :notes
  has_many :activities
end
