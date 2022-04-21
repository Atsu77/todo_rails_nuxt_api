class TodoSerializer < ActiveModel::Serializer
  attributes :id, :name, :user_id, :username
  belongs_to :user

  def username
    object.user.name
  end
end
