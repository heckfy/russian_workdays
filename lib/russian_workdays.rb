require 'russian_workdays/version'
require 'open-uri'
require 'nokogiri'

module RussianWorkdays
  class << self
    def get_dates year
      if @year == year
        return @dates
      else
        @year = year
      end
      @dates = parse Nokogiri::HTML(open("http://www.superjob.ru/proizvodstvennyj_kalendar/#{year}"))
    end

    def parse page
      dates = {}
      months = [nil, 'Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь']
      page.css('td.pk_container').each do |month|
        month.css('div.pk_cells div').each do |day|
          unless day.attr('class') == 'pk_other'
            date = Date.new @year, months.index(month.css('div.pk_header').inner_text), day.inner_text.to_i
            case day.attr 'class'
              when /pk_holiday/
                dates[date] = 'holiday'
              when /pk_preholiday/
                dates[date] = 'short'
              else
                dates[date] = 'work'
            end
          end
        end
      end
      dates
    end

    %w(holiday short work).each do |method|
      define_method("#{method}?") do |date|
        get_dates(date.year)[date] == method
      end

      define_method("#{method}s") do |year|
        get_dates(year).select{|key, value| value == method}.keys
      end
    end
  end
end
