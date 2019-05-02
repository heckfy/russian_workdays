# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Collection do
  before(:all) do
    @collection = RussianWorkdays::Collection.new((Date.new(2014, 1, 1)..Date.new(2014, 12, -1)))
    @holidays = %w[2014-01-01 2014-03-22 2014-07-12 2014-09-06 2014-10-26 2014-12-28]
    @preholidays = %w[2014-02-24 2014-03-07 2014-04-30 2014-05-08 2014-06-11 2014-12-31]
    @works = %w[2014-01-09 2014-02-03 2014-05-27 2014-07-22 2014-11-11 2014-12-30]
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
