class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :area, :professor, :lapse, :notes, :power
  has_one :user
end
