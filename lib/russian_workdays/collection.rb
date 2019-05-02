# frozen_string_literal: true

module RussianWorkdays
  class Collection
    include Enumerable
    AVAILABLE_WORK_HOURS_PER_WEEK = [24, 36, 40].freeze

    def initialize(collection)
      unless %w[Array Range].include? collection.class.name
        raise ArgumentError, "Must be a Array or Range object"
      end
      @collection = collection.to_a
    end

    def each
      @collection.each { |i| yield(i) }
    end

    %w[holiday preholiday work].each do |type|
      define_method "#{type}s" do
        @collection.select { |date| Day.new(date).send("#{type}?") }
      end
    end

    def work_hours_count(work_hours_per_week = 40)
      unless AVAILABLE_WORK_HOURS_PER_WEEK.include?(work_hours_per_week)
        raise ArgumentError, "Unknown work hours count. Must be one of #{AVAILABLE_WORK_HOURS_PER_WEEK}"
      end
      work_hours_per_day = (work_hours_per_week / 5.to_f)
      mapping = { work: work_hours_per_day, preholiday: work_hours_per_day - 1 }
      @collection.map { |i| mapping.fetch(Day.new(i).type, 0) }.sum.ceil(1)
    end
  end
end
