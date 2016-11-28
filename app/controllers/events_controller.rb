class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update]

  def index
    @events = Event.includes(:group_event).where(deleted: false)
    render json: @events
  end

  def show
    if @event.deleted
      render json: nil, status: :not_found
    else
      render json: @event
    end
  end

  def create
    result = EventSaver.new(event_params).create
    saved, event = result.first, result.second
    if saved
      render json: event, status: :created, location: event
    else
      render json: event.errors, status: :unprocessable_entity
    end
  end

  def update
    updated = EventSaver.new(event_params).update(@event)
    if updated
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.update_columns(deleted: true)
    render json: {message: "Event was deleted"}.to_json, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: {message: "Event not found"}.to_json, status: :not_found
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(
    :name,
    :description,
    :location,
    :start_date,
    :end_date,
    :published,
    :deleted,
    :duration,
    :group_event_id
    )
  end
end
