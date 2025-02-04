# frozen_string_literal: true

require 'spec_helper'
require 'date'

describe RussianWorkdays::Day do
  subject(:instance_of_day) { described_class.new(date) }

  let(:work_date) { Date.new(2014, 5, 5) }
  let(:preholiday_date) { Date.new(2014, 2, 24) }
  let(:holiday_date) { Date.new(2014, 5, 1) }

  describe '#initialize' do
    context 'when date is not Date object' do
      let(:date) { 'string' }

      it 'raise ArgumentError' do
        expect { instance_of_day }.to raise_error(ArgumentError, /Must be a Date object/)
      end
    end

    context 'when missing data for that year' do
      let(:date) { Date.new(1990, 1, 1) }

      it 'raise MissingYearError' do
        expect { instance_of_day }
          .to raise_error(RussianWorkdays::MissingYearError, /Data missing for that year: 1990/)
      end
    end
  end

  describe '#work?' do
    context 'when date is work day' do
      let(:date) { work_date }

      it 'return true' do
        expect(instance_of_day.work?).to eq(true)
      end
    end

    context 'when date is preholiday' do
      let(:date) { preholiday_date }

      it 'return true' do
        expect(instance_of_day.work?).to eq(true)
      end
    end

    context 'when date is holiday' do
      let(:date) { holiday_date }

      it 'return false' do
        expect(instance_of_day.work?).to eq(false)
      end
    end
  end

  describe '#preholiday?' do
    context 'when date is work day' do
      let(:date) { work_date }

      it 'return true' do
        expect(instance_of_day.preholiday?).to eq(false)
      end
    end

    context 'when date is preholiday' do
      let(:date) { preholiday_date }

      it 'return true' do
        expect(instance_of_day.preholiday?).to eq(true)
      end
    end

    context 'when date is holiday' do
      let(:date) { holiday_date }

      it 'return false' do
        expect(instance_of_day.preholiday?).to eq(false)
      end
    end
  end

  describe '#holiday?' do
    context 'when date is work day' do
      let(:date) { work_date }

      it 'return true' do
        expect(instance_of_day.holiday?).to eq(false)
      end
    end

    context 'when date is preholiday' do
      let(:date) { preholiday_date }

      it 'return true' do
        expect(instance_of_day.holiday?).to eq(false)
      end
    end

    context 'when date is holiday' do
      let(:date) { holiday_date }

      it 'return false' do
        expect(instance_of_day.holiday?).to eq(true)
      end
    end
  end

  describe '#type' do
    context 'when date is work day' do
      let(:date) { work_date }

      it 'return :work' do
        expect(instance_of_day.type).to eq(:work)
      end
    end

    context 'when date is preholiday' do
      let(:date) { preholiday_date }

      it 'return :preholiday' do
        expect(instance_of_day.type).to eq(:preholiday)
      end
    end

    context 'when date is holiday' do
      let(:date) { holiday_date }

      it 'return :holiday' do
        expect(instance_of_day.type).to eq(:holiday)
      end
    end
  end
end
