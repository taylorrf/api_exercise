require 'test_helper'

class GroupEventTest < ActiveSupport::TestCase
  should belong_to(:user)
  should have_many(:events)
end
