module BooleanValidator
  extend ActiveSupport::Concern

  class BooleanValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      return if value.in? [true, false]
      record.errors.add attribute, :boolean
    end
  end
end
