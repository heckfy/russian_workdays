# frozen_string_literal: true

require_relative "collection_preset"

module RussianWorkdays
  class Year < CollectionPreset
    def initialize(year = Date.today.year)
      @dates = Collection.new(Date.new(year, 1, 1)..Date.new(year, 12, -1))
    end
  end
end
