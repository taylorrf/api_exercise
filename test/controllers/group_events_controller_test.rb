require 'test_helper'

class GroupEventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_event = group_events(:brazil_trip)
  end

  test "should get index" do
    get group_events_url, as: :json
    assert_response :success
  end

  test "should create group_event" do
    assert_difference('GroupEvent.count') do
      post group_events_url, params: {
          group_event: {
              days_duration: @group_event.days_duration,
              title: @group_event.title,
              user_id: @group_event.user_id
          }
      }, as: :json
    end

    assert_response 201
  end

  test "should show group_event" do
    get group_event_url(@group_event), as: :json
    assert_response :success
  end

  test "should update group_event" do
    patch group_event_url(@group_event), params: {
        group_event: {
          days_duration: @group_event.days_duration,
          title: @group_event.title,
          user_id: @group_event.user_id
        }
    }, as: :json

    assert_response 200
  end
end
