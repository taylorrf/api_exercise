require 'test_helper'

class EventTest < ActiveSupport::TestCase
  should belong_to(:group_event)

  setup do
    @event = events(:buy_tickets)
  end

  test "#duration calculated based on two dates" do
    assert_equal 1, @event.duration
  end

  test "#duration can't calulate without both dates" do
    @event.start_date = nil
    assert_nil @event.duration
  end

  test "#duration can't calulate when start date are greater than end date" do
    @event.start_date = Date.today.+(2)
    @event.end_date = Date.today
    assert_nil @event.duration
  end

  test "#status returns status `draft` when it's not published" do
    assert_equal "draft", @event.status
  end

  test "#status returns status published when it is published" do
    @event.published = true
    assert_equal "published", @event.status
  end
end
