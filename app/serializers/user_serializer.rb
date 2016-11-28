class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :group_events
end
