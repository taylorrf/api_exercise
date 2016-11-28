class Event < ApplicationRecord
  attr_reader :status
  attr_accessor :duration

  belongs_to :group_event
  validates_with EventDateValidator

  def status
    self.published ? "published" : "draft"
  end

  def duration
    if self.start_date && self.end_date
      self.duration = (self.end_date - self.start_date).to_i
    end
  end
end
