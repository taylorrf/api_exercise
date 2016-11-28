class GroupEventSerializer < ActiveModel::Serializer
  attributes :id, :title, :user_id
  belongs_to :user
  has_many :events
end
