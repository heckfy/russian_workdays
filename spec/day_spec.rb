# frozen_string_literal: true

require "spec_helper"
require "date"

describe RussianWorkdays::Year do
  before(:all) do
    @year = RussianWorkdays::Year.new(2024)
    @holidays = %w[2024-01-01 2024-03-23 2024-07-13 2024-09-08 2024-10-26 2024-12-31]
    @preholidays = %w[2024-02-22 2024-03-07 2024-05-08 2024-06-11 2024-11-02]
    @works = %w[2024-01-09 2024-02-02 2024-04-27 2024-07-22 2024-11-02 2024-12-28]
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

  context "when works day in yml is empty" do
    it "should return true when holiday day" do
      expect(RussianWorkdays::Day.new(Date.new(2023, 11, 18)).holiday?).to be(true)
    end
  end
end
