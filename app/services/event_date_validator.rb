class EventDateValidator < ActiveModel::Validator
  def validate(record)
    if record.end_date.present? && record.start_date.present?
      if record.start_date > record.end_date
        record.errors[:base] << "First date should be greater than End date"
      end
    end
  end
end
