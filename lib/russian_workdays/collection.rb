# frozen_string_literal: true

module RussianWorkdays
  class Collection
    include Enumerable

    WORK_HOURS_PER_DAY = {
      24 => 4.8,
      36 => 7.2,
      40 => 8.0
    }.freeze

    attr_reader :collection

    def initialize(collection)
      raise ArgumentError, 'Must be a Array or Range object' unless [Array, Range].include?(collection.class)

      collection.each { |date| raise MissingYearError, date.year unless DATES.key?(date.year) }

      @collection = collection.map { |day| Day.new(day) }
    end

    def each(&block)
      collection.each(&block)
    end

    %w[holiday preholiday work].each do |type|
      define_method "#{type}s" do
        collection.select { |day| day.send("#{type}?") }.map(&:to_date)
      end
    end

    def work_hours_count(work_hours_per_week = WORK_HOURS_PER_DAY.keys.last)
      unless WORK_HOURS_PER_DAY.keys.include?(work_hours_per_week)
        raise ArgumentError, "Unknown work hours count. Must be one of: #{WORK_HOURS_PER_DAY.keys.join(', ')}"
      end

      collection.sum { |day| calculate_work_hours(day, work_hours_per_week) }.ceil(1)
    end

    private

    def calculate_work_hours(day, work_hours_per_week)
      case day.type
      when :work
        WORK_HOURS_PER_DAY[work_hours_per_week]
      when :preholiday
        WORK_HOURS_PER_DAY[work_hours_per_week] - 1
      else
        0
      end
    end
  end
end
