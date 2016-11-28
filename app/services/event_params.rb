class EventParams
  attr_reader :params

  def initialize params
    @params = params.to_h
  end

  def to_save
    sum_duration_to_dates
    fill_empty_dates
    fill_empty_keys

    params.merge({
      draft: is_draft?,
      published: !is_draft?
    })
  end

  private

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
    params[:name] = "" if params[:name].blank?
    params[:description] = "" if params[:description].blank?
    params[:location] =  "" if params[:location].blank?
  end
end
