# frozen_string_literal: true

require "yaml"

module RussianWorkdays
  DATES = YAML.unsafe_load_file(File.join(__dir__, "dates.yml")).freeze

  class Day
    def initialize(date)
      @date = date
      raise ArgumentError, "Must be a Date object" unless @date.is_a?(::Date)
      raise ArgumentError, "Data missing for that year" unless DATES.key?(@date.year)
    end

    def holiday?
      !preholiday? && (weekend? || DATES[@date.year][:holidays].include?(@date))
    end

    def preholiday?
      DATES[@date.year][:preholidays].include?(@date)
    end

    def work?
      !holiday?
    end

    def type
      return :holiday if holiday?
      return :preholiday if preholiday?
      return :work if work?
    end

    private

    def weekend?
      (@date.sunday? || @date.saturday?) && !DATES[@date.year][:works]&.include?(@date)
    end
  end
end
