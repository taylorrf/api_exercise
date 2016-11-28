class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :location, :start_date, :end_date, :status, :duration
  belongs_to :group_event
end
