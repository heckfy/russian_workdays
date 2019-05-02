# frozen_string_literal: true

require_relative "collection_preset"

module RussianWorkdays
  class Month < CollectionPreset
    def initialize(year = Date.today.year, month = 1)
      raise ArgumentError, "Must be a number between 1 and 12" unless (1..12).include?(month)
      @dates = Collection.new(Date.new(year, month, 1)..Date.new(year, month, -1))
    end
  end
end
