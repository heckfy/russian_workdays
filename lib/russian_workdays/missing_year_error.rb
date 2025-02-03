# frozen_string_literal: true

module RussianWorkdays
  class MissingYearError < ArgumentError
    attr_reader :year

    def initialize(year)
      super
      @year = year
    end

    def to_s
      "Data missing for that year: #{year}"
    end
  end
end
