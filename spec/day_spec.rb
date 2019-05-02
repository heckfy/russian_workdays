# frozen_string_literal: true

require "spec_helper"
require "date"

describe RussianWorkdays::Year do
  before(:all) do
    @year = RussianWorkdays::Year.new(2014)
    @holidays = %w[2014-05-01 2014-05-02 2014-05-03 2014-05-04]
    @preholidays = %w[2014-02-24 2014-03-07 2014-04-30 2014-05-08 2014-06-11 2014-12-31]
    @works = %w[2014-05-05 2014-05-06 2014-05-06]
  end

  it "should return true if date is preholiday day" do
    @preholidays.each do |date|
      expect(RussianWorkdays::Day.new(Date.parse(date)).preholiday?).to eq(true)
    end
  end

  it "should return true if date is holiday day" do
    @holidays.each do |date|
      expect(RussianWorkdays::Day.new(Date.parse(date)).holiday?).to eq(true)
    end
  end

  it "should return true if date is work day" do
    @works.each do |date|
      expect(RussianWorkdays::Day.new(Date.parse(date)).work?).to eq(true)
    end
  end
end
