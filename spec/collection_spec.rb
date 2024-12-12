# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Collection do
  before(:all) do
    @collection = RussianWorkdays::Collection.new((Date.new(2025, 1, 1)..Date.new(2025, 12, -1)))
    @holidays = %w[2025-01-01 2025-01-02 2025-01-03 2025-01-04 2025-01-05 2025-01-06 2025-01-07 2025-01-08 2025-02-22 2025-02-23 2025-03-08 2025-03-09 2025-05-01 2025-05-02 2025-05-08 2025-05-09 2025-06-12 2025-06-13 2025-11-03 2025-11-04 2025-12-31]
    @preholidays = %w[2025-03-07 2025-04-30 2025-06-11 2025-11-01]
    @works = %w[2025-01-09 2025-02-03 2025-04-25 2025-07-22 2025-11-01 2025-12-30]
  end

  it "should return the right preholiday days" do
    preholidays = @collection.preholidays.map(&:to_s)
    expect(preholidays).to eq(@preholidays)
  end

  it "should return the right holydays" do
    holidays = @collection.holidays.map(&:to_s)
    expect(holidays).to include(*@holidays)
  end

  it "should return the right preholiday works" do
    works = @collection.works.map(&:to_s)
    expect(works).to include(*@works)
  end
end
