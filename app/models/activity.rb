class Activity < ApplicationRecord
  belongs_to :subject
  belongs_to :user
end
