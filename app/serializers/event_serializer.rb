class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :start_date, :end_date, :status
  belongs_to :group_event
end
