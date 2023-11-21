# frozen_string_literal: true

require "spec_helper"

describe RussianWorkdays::Month do
  before(:all) do
    @month = RussianWorkdays::Month.new(2024, 5)
    @holidays = %w[2024-05-01 2024-05-09 2024-05-10]
    @preholidays = %w[2024-05-08]
    @works = %w[2024-05-06 2024-05-07 2024-05-08]
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
