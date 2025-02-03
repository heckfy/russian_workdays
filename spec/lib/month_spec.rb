# frozen_string_literal: true

require 'spec_helper'

describe RussianWorkdays::Month do
  subject(:instance_of_month) { described_class.new(year, month) }

  let(:year) { 2014 }
  let(:month) { 2 }

  describe '#initialize' do
    context 'when missing data for that year' do
      let(:year) { 1990 }

      it 'raise MissingYearError' do
        expect { instance_of_month }
          .to raise_error(RussianWorkdays::MissingYearError, /Data missing for that year: 1990/)
      end
    end

    context 'when month is not in 1..12' do
      let(:month) { 0 }

      it 'raise ArgumentError' do
        expect { instance_of_month }
          .to raise_error(ArgumentError, /Must be a number between 1 and 12/)
      end
    end
  end

  describe '#holidays' do
    let(:expected_array) do
      [1, 2, 8, 9, 15, 16, 22, 23].map { |day| Date.new(year, month, day) }
    end

    it 'array of holidays Date' do
      expect(instance_of_month.holidays).to eq(expected_array)
    end
  end

  describe '#preholidays' do
    let(:expected_array) do
      [Date.new(year, month, 24)]
    end

    it 'array of preholidays Date' do
      expect(instance_of_month.preholidays).to eq(expected_array)
    end
  end

  describe '#works' do
    let(:expected_array) do
      [3, 4, 5, 6, 7, 10, 11, 12, 13, 14, 17, 18, 19, 20, 21, 24, 25, 26, 27, 28].map do |day|
        Date.new(year, month, day)
      end
    end

    it 'array of works Date' do
      expect(instance_of_month.works).to eq(expected_array)
    end
  end
end
