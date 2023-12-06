# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Year do
  before(:all) do
    @year = RussianWorkdays::Year.new(2014)
    @holidays = %w[2014-05-01 2014-05-02 2014-05-03 2014-05-04]
    @preholidays = %w[2014-02-24 2014-03-07 2014-04-30 2014-05-08 2014-06-11 2014-12-31]
    @works = %w[2014-05-05 2014-05-06 2014-05-06]
  end

  it "should return the right preholiday days" do
    preholidays = @year.preholidays.map(&:to_s)
    expect(preholidays).to eq(@preholidays)
  end

  it "should return the right holydays" do
    holidays = @year.holidays.map(&:to_s)
    expect(holidays).to include(*@holidays)
  end

  it "should return the right preholiday works" do
    works = @year.works.map(&:to_s)
    expect(works).to include(*@works)
  end
end
