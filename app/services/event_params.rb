class EventParams
  attr_reader :params

  def initialize params
    @params = params
  end

  def to_save
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
