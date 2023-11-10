class TaskSerializer < ActiveModel::Serializer
  attributes :id,
             :title,
             :description,
             :completed

  has_one :user

  def completed
    {
      is_completed: object.is_completed,
      completed_at: object.is_completed == false ? nil : object.updated_at,
      message: object.is_completed == false ? 'No completada' : 'Completada',
    }
  end
end
