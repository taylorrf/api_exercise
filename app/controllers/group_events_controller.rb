class GroupEventsController < ApplicationController
  before_action :set_group_event, only: [:show, :update, :destroy]

  def index
    @group_events = GroupEvent.all

    render json: @group_events
  end

  def show
    render json: @group_event
  end

  def create
    @group_event = GroupEvent.new(group_event_params)

    if @group_event.save
      render json: @group_event, status: :created, location: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @group_event.update(group_event_params)
      render json: @group_event
    else
      render json: @group_event.errors, status: :unprocessable_entity
    end
  end

  private

  def set_group_event
    @group_event = GroupEvent.find(params[:id])
  end

  def group_event_params
    params.require(:group_event).permit(
    :title,
    :user_id
    )
  end
end
