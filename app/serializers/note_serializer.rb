class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :note_type
  has_one :subject
  has_one :user
end
