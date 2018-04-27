# frozen_string_literal: true

require "mail"
module EmailValidateable
  extend ActiveSupport::Concern

  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      begin
        email_address = Mail::Address.new(value)
      rescue Mail::Field::ParseError
        record.errors[attribute] << (options[:message] || "it is not a valid email")
      end
    end
  end
end
