require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should belong_to(:group_event)
end
