class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :title, :area, :professor, :lapse, :power, :promedy
  has_one :user
  has_many :activities

  def promedy
    object.activities.sum(:calification) / object.activities.length
  end
end
