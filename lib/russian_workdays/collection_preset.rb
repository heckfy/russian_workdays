# frozen_string_literal: true

require 'forwardable'

module RussianWorkdays
  class CollectionPreset
    extend Forwardable
    def_delegators :dates, :holidays, :preholidays, :works, :work_hours_count

    private

    def dates
      Collection.new(range)
    end
  end
end
