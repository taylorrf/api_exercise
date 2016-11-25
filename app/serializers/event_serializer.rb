class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :location, :start_date, :end_date, :draft, :published
  belongs_to :group_event
end
