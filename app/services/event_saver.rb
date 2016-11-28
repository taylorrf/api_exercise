class EventSaver
  attr_reader :params, :event

  def initialize params
    @params = params.to_h
  end

  def create
    event = Event.new(params_to_save)
    [event.save, event]
  end

  def update(record)
    @event = record
    record.update(params_to_save)
  end

  private

  def params_to_save
    sum_duration_to_dates
    fill_empty_dates
    fill_empty_keys

    params.merge({
      draft: is_draft?,
      published: !is_draft?
    })
  end

  def is_draft?
    params.map{ |param| param.last.to_s.empty? }.any?
  end

  def sum_duration_to_dates
    if params[:duration].present?
      if params[:start_date].blank?
        params[:start_date] = Date.today
        params[:end_date] = Date.today.+(params[:duration].to_i)
      end

      if params[:start_date].present? && params[:end_date].blank?
        params[:end_date] = params[:start_date].+(params[:duration].to_i)
      end
    end
  end

  def fill_empty_dates
    params[:end_date] = Date.today if params[:end_date].blank?
    params[:start_date] = Date.today if params[:start_date].blank?
  end

  def fill_empty_keys
    params[:name] = (event && event.name) || "" if params[:name].blank?
    params[:description] = (event && event.description ) || "" if params[:description].blank?
    params[:location] =  (event && event.location) || "" if params[:location].blank?
  end
end
