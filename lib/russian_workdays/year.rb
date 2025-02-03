# frozen_string_literal: true

require_relative 'missing_year_error'
require_relative 'collection_preset'

module RussianWorkdays
  class Year < CollectionPreset
    attr_reader :year

    def initialize(year = Date.today.year)
      raise MissingYearError, year unless DATES.key?(year)

      @year = year
    end

    private

    def range
      Date.new(year, 1, 1)..Date.new(year, 12, -1)
    end
  end
end
