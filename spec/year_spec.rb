# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Year do
  before(:all) do
    @year = RussianWorkdays::Year.new(2024)
    @holidays = %w[2024-01-01 2024-03-23 2024-07-13 2024-09-08 2024-10-26 2024-12-31]
    @preholidays = %w[2024-02-22 2024-03-07 2024-05-08 2024-06-11 2024-11-02]
    @works = %w[2024-01-09 2024-02-02 2024-04-27 2024-07-22 2024-11-02 2024-12-28]
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
