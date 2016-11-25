require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should belong_to(:group_event)
  should_not allow_value("").for(:name)
  should_not allow_value("").for(:start_date)
  should_not allow_value("").for(:end_date)
end
