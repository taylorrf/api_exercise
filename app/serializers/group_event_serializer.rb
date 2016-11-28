class GroupEventSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
  has_many :events
end
