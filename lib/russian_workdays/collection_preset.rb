# frozen_string_literal: true

require "forwardable"

class CollectionPreset
  extend Forwardable
  def_delegators :@dates, :holidays, :preholidays, :works, :work_hours_count
end
