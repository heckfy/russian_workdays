# frozen_string_literal: true

require "yaml"
require "date"

module RussianWorkdays
  DATES = YAML.safe_load(File.read(File.join(__dir__, "dates.yml")), permitted_classes: [::Date, Symbol]).freeze

  class Day
    def initialize(date)
      @date = date

      raise ArgumentError, "Must be a Date object" unless @date.is_a?(::Date)
      raise ArgumentError, "Data missing for that year" unless (@year_data = DATES[@date.year])
    end

    def holiday?
      return false if preholiday?

      weekend? || government_holiday? ||
      (@year_data.key?(:holidays) && @year_data[:holidays].include?(@date)) # compatibility
    end

    def preholiday?
      @year_data[:preholidays].include?(@date)
    end

    def work?
      !holiday?
    end

    def type
      return :holiday if holiday?
      return :preholiday if preholiday?
      return :work if work?
    end

    def government_holiday?
      @year_data.key?(:government_holidays) && @year_data[:government_holidays].include?(@date)
    end

    private

    def weekend?
      return false if @year_data.key?(:moved_weekends) && @year_data[:moved_weekends].keys.include?(@date)

      @date.sunday? || @date.saturday? || (@year_data.key?(:moved_weekends) && DATES[@date.year][:moved_weekends].values.include?(@date))
    end
  end
end
