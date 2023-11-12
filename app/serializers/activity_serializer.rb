class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :title, :calification
  has_one :subject
  has_one :user
end
