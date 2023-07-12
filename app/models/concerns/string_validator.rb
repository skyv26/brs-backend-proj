module StringValidator
  extend ActiveSupport::Concern

  class StringValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return unless value.blank? || value.length < 2 || value.length > 50

      record.errors.add(attribute, 'must be between 2 and 50 characters')
    end
  end
end
