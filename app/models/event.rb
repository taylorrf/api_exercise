class Event < ApplicationRecord
  belongs_to :group_event
  validates :name, :start_date, :end_date, presence: true
end
