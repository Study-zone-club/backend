class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :area, :professor, :lapse, :power
  has_one :user
  has_many :activities

  def promedy
    object.activities.calification.sum
  end
end
