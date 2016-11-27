class EventSaver
  attr_reader :event, :params

  def initialize params
    @params = params
    @event = Event.new(event_params)
  end

  def save
    event.save
  end

  def errors
    event.errors
  end

  def event_params
    params.to_h.merge({
      draft: is_draft?,
      published: !is_draft?
    })
  end

  private

  def is_draft?
    params.to_h.map{ |param| param.last.to_s.empty? }.any?
  end
end
