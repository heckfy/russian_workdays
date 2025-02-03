# frozen_string_literal: true

require_relative 'missing_year_error'
require_relative 'collection_preset'

module RussianWorkdays
  class Month < CollectionPreset
    attr_reader :year, :month

    def initialize(year = Date.today.year, month = 1)
      raise MissingYearError, year unless DATES.key?(year)
      raise ArgumentError, 'Must be a number between 1 and 12' unless (1..12).include?(month)

      @year = year
      @month = month
    end

    private

    def range
      Date.new(year, month, 1)..Date.new(year, month, -1)
    end
  end
end
