class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :note_type, :updated_at, :created_at
  has_one :subject
  has_one :user
end
