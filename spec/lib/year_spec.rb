# frozen_string_literal: true

require 'spec_helper'

describe RussianWorkdays::Year do
  subject(:instance_of_year) { described_class.new(year) }

  let(:year) { 2014 }

  describe '#initialize' do
    context 'when missing data for that year' do
      let(:year) { 1990 }

      it 'raise MissingYearError' do
        expect { instance_of_year }
          .to raise_error(RussianWorkdays::MissingYearError, /Data missing for that year: 1990/)
      end
    end
  end

  describe '#holidays' do
    let(:expected_array) do
      (1..12).flat_map { |month| RussianWorkdays::Month.new(year, month).holidays }
    end

    it 'array of holidays Date' do
      expect(instance_of_year.holidays).to eq(expected_array)
    end
  end

  describe '#preholidays' do
    let(:expected_array) do
      (1..12).flat_map { |month| RussianWorkdays::Month.new(year, month).preholidays }
    end

    it 'array of preholidays Date' do
      expect(instance_of_year.preholidays).to eq(expected_array)
    end
  end

  describe '#works' do
    let(:expected_array) do
      (1..12).flat_map { |month| RussianWorkdays::Month.new(year, month).works }
    end

    it 'array of works Date' do
      expect(instance_of_year.works).to eq(expected_array)
    end
  end
end
