# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Month do
  before(:all) do
    @month = RussianWorkdays::Month.new(2025, 3)
    @holidays = %w[2025-03-08 2025-03-09]
    @preholidays = %w[2025-03-07]
    @works = %w[2025-03-04 2025-03-05 2025-03-06]
  end

  it "should return the right preholiday days" do
    preholidays = @month.preholidays.map(&:to_s)
    expect(preholidays).to eq(@preholidays)
  end

  it "should return the right holydays" do
    holidays = @month.holidays.map(&:to_s)
    expect(holidays).to include(*@holidays)
  end

  it "should return the right preholiday works" do
    works = @month.works.map(&:to_s)
    expect(works).to include(*@works)
  end
end
