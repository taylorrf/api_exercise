require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url, as: :json
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post events_url, params: {
        event: {
          name: @event.name,
          description: @event.description,
          start_date: @event.start_date
          end_date: @event.end_date,
          group_event_id: @event.group_event_id,
          location: @event.location,
          published: @event.published
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should show event" do
    get event_url(@event), as: :json
    assert_response :success
  end

  test "can't show an deleted event" do
    @event = events(:deleted)
    get event_url(@event), as: :json
    assert_response :not_found
  end

  test "should update event" do
    patch event_url(@event), params: {
      event: {
        deleted: @event.deleted,
        description: @event.description,
        end_date: @event.end_date,
        group_event_id: @event.group_event_id,
        location: @event.location,
        name: @event.name,
        published: @event.published,
        start_date: @event.start_date
      }
    }, as: :json

    assert_response 200
  end

  test "should destroy event, keeping on database by setting deleted to true" do
    assert_equal(false, @event.deleted)
    delete event_url(@event), as: :json
    assert_equal(true, @event.reload.deleted)
    assert_response 204
  end
end
