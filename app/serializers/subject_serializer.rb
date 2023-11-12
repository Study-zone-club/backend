class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :area, :professor, :lapse, :power
  has_one :user
end
