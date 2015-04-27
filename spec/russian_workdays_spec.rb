require 'spec_helper'

describe RussianWorkdays do
  before(:all) do
    @shorts = %w(2014-02-24 2014-03-07 2014-04-30 2014-05-08 2014-06-11 2014-12-31)
    @holidays = %w(2014-01-01 2014-03-22 2014-07-12 2014-09-06 2014-10-26 2014-12-28)
    @works = %w(2014-01-09 2014-02-03 2014-05-27 2014-07-22 2014-11-11 2014-12-30)
  end

  it 'should return the right short days' do
    expect(RussianWorkdays.shorts(2014).map(&:to_s)).to eq(@shorts)
  end

  it 'should return the right holydays' do
    expect(RussianWorkdays.holidays(2014).map(&:to_s)).to include(*@holidays)
  end

  it 'should return the right short works' do
    expect(RussianWorkdays.works(2014).map(&:to_s)).to include(*@works)
  end

  it 'should return true if date is short day' do
    @shorts.each do |date|
      expect(RussianWorkdays.short?(Date.parse(date))).to eq(true)
    end
  end

  it 'should return true if date is holiday day' do
    @holidays.each do |date|
      expect(RussianWorkdays.holiday?(Date.parse(date))).to eq(true)
    end
  end

  it 'should return true if date is work day' do
    @works.each do |date|
      expect(RussianWorkdays.work?(Date.parse(date))).to eq(true)
    end
  end
  
  it 'should return array of Date for holidays' do
    RussianWorkdays.holidays(2014).each do |date|
      expect(date.is_a?(Date)).to eq(true)
    end
  end
  
  it 'should return array of Date for works' do
    RussianWorkdays.works(2014).each do |date|
      expect(date.is_a?(Date)).to eq(true)
    end
  end
  
  it 'should return array of Date for shorts' do
    RussianWorkdays.shorts(2014).each do |date|
      expect(date.is_a?(Date)).to eq(true)
    end
  end

  it 'should process shot day like work day' do
      expect(RussianWorkdays.short?(Date.new(2015, 5, 8))).to eq(true)
      expect(RussianWorkdays.work?(Date.new(2015, 5, 8))).to eq(true)
  end
end