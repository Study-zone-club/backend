class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :days_of_week, :from, :to
  has_one :subject
  has_one :user
end
