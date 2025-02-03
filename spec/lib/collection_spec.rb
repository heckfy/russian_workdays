# frozen_string_literal: true

require 'spec_helper'

describe RussianWorkdays::Collection do
  subject(:instance_of_collection) { described_class.new(range) }

  let(:year) { 2014 }
  let(:month) { 2 }
  let(:range) { (Date.new(year, month, 20)..Date.new(year, month, -1)) }

  describe '#initialize' do
    context 'when missing data for that year' do
      let(:year) { 1990 }

      it 'raise MissingYearError' do
        expect { instance_of_collection }
          .to raise_error(RussianWorkdays::MissingYearError, /Data missing for that year: 1990/)
      end
    end

    context 'when range is not Array or Range object' do
      let(:range) { 0 }

      it 'raise ArgumentError' do
        expect { instance_of_collection }
          .to raise_error(ArgumentError, /Must be a Array or Range object/)
      end
    end
  end

  describe '#holidays' do
    let(:expected_array) do
      [22, 23].map { |day| Date.new(year, month, day) }
    end

    it 'array of holidays Date' do
      expect(instance_of_collection.holidays).to eq(expected_array)
    end
  end

  describe '#preholidays' do
    let(:expected_array) do
      [Date.new(year, month, 24)]
    end

    it 'array of preholidays Date' do
      expect(instance_of_collection.preholidays).to eq(expected_array)
    end
  end

  describe '#works' do
    let(:expected_array) do
      [20, 21, 24, 25, 26, 27, 28].map do |day|
        Date.new(year, month, day)
      end
    end

    it 'array of works Date' do
      expect(instance_of_collection.works).to eq(expected_array)
    end
  end

  describe '#work_hours_count' do
    context 'when work_hours_per_week is not one of: 24, 36, 40' do
      it 'raise ArgumentError' do
        expect { instance_of_collection.work_hours_count(10) }
          .to raise_error(ArgumentError, /Unknown work hours count. Must be one of: 24, 36, 40/)
      end
    end

    context 'when week have 24 work hours' do
      it { expect(instance_of_collection.work_hours_count(24)).to eq(32.6) }
    end

    context 'when week have 36 work hours' do
      it { expect(instance_of_collection.work_hours_count(36)).to eq(49.4) }
    end

    context 'when week have 40 work hours' do
      it { expect(instance_of_collection.work_hours_count).to eq(55) }
    end
  end
end
