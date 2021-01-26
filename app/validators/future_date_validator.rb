class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    
    return unless value.present? && value < Date.today

    message = options[:message] || :future_date
    record.errors.add(attribute, message)
  end
end
