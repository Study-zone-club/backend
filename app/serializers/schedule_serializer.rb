class ScheduleSerializer < ActiveModel::Serializer
  attributes :id, :days_of_week, :from, :to, :from_parser, :to_parser
  has_one :subject

  def from_parser
    object.from.strftime("%H:%M")
  end

  def to_parser
    object.to.strftime("%H:%M")
  end
end
