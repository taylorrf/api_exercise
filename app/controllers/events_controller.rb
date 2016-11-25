class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :destroy]

  def index
    @events = Event.where(deleted: false)
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
    @event = Event.new(event_params)

    if @event.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event.update_columns(deleted: true)
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
    :group_event_id
    )
  end
end
