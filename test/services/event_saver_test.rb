require 'test_helper'

class EventSaverTest < ActiveSupport::TestCase
  setup do
    @group_event = group_events(:brazil_trip)
  end

  test "#create a draft with a small dataset" do
    saver =  EventSaver.new({name: "test", group_event_id: @group_event.id}).create
    saved, event = saver.first, saver.second
    assert_equal saved, true
    assert_equal event.draft, true
    assert_equal event.status, "draft"
  end

  test "#create a published event with a complete dataset" do
    saver =  EventSaver.new({name: "test", description: "cool", location: "anywhere", start_date: '12-10-2016', end_date: '13-10-2016', group_event_id: @group_event.id}).create
    saved, event = saver.first, saver.second
    assert_equal saved, true
    assert_equal event.status, "published"
    assert_equal event.published, true
  end

  test "#create can't create an event without a group_event_id" do
    saver =  EventSaver.new({name: "test"}).create
    saved, event = saver.first, saver.second
    assert_equal saved, false
    assert_not_empty event.errors
  end

  test "#create calculates dates with a duration attribute" do
    saver =  EventSaver.new({name: "test duration", duration: 3, group_event_id: @group_event.id}).create
    saved, event = saver.first, saver.second
    assert_equal saved, true

    assert_not_nil event.start_date
    assert_not_nil event.end_date

    assert_equal event.start_date, Date.today
    assert_equal event.end_date, Date.today.+(3)
  end

  test "#update works fine" do
    new_event =  EventSaver.new({name: "test", group_event_id: @group_event.id}).create
    event = new_event.second

    updated = EventSaver.new({name: "updated name"}).update(event)

    assert_equal updated, true
    assert_equal event.name, "updated name"
  end

  test "#update will not mutate previous values when updating something" do
    new_event =  EventSaver.new({name: "test", description: "it's good?", location: 'good', group_event_id: @group_event.id}).create
    event = new_event.second

    updated = EventSaver.new({name: "updated name"}).update(event)

    assert_equal updated, true
    assert_equal event.description, "it's good?"
    assert_equal event.location, "good"
  end
end
