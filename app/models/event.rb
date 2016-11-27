class Event < ApplicationRecord
  attr_reader :status
  belongs_to :group_event

  def status
    self.published ? "published" : "draft"
  end
end
