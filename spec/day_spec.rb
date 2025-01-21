# frozen_string_literal: true

require "spec_helper"
require "date"

describe RussianWorkdays::Year do
  before(:all) do
    @year = RussianWorkdays::Year.new(2025)
    @holidays = %w[2025-01-01 2025-01-02 2025-01-03 2025-01-04 2025-01-05 2025-01-06 2025-01-07 2025-01-08 2025-02-22 2025-02-23 2025-03-08 2025-03-09 2025-05-01 2025-05-02 2025-05-08 2025-05-09 2025-06-12 2025-06-13 2025-11-03 2025-11-04 2025-12-31]
    @preholidays = %w[2025-03-07 2025-04-30 2025-06-11 2025-11-01]
    @works = %w[2025-01-09 2025-02-03 2025-04-25 2025-07-22 2025-11-01 2025-12-30]
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
