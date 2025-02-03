# frozen_string_literal: true

require_relative 'missing_year_error'

module RussianWorkdays
  class Day
    attr_reader :date

    def initialize(date)
      raise ArgumentError, 'Must be a Date object' unless date.is_a?(::Date)
      raise MissingYearError, date.year unless DATES.key?(date.year)

      @date = date
    end

    def holiday?
      return true if DATES[date.year][:holidays].include?(date)

      !preholiday? && weekend?
    end

    def preholiday?
      DATES[date.year][:preholidays].include?(date)
    end

    def work?
      !holiday?
    end

    def type
      return :holiday if holiday?
      return :preholiday if preholiday?

      :work if work?
    end

    def to_date
      date
    end

    private

    def weekend?
      date.sunday? || date.saturday?
    end
  end
end
