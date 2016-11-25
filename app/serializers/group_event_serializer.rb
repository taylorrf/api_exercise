class GroupEventSerializer < ActiveModel::Serializer
  attributes :id, :title, :days_duration
  belongs_to :user
  has_many :events
end
