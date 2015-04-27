require 'yaml'

class RussianWorkdays
  class << self
    %w(holiday short).each do |method|
      define_method("#{method}?") do |date|
        raise ArgumentError.new('Argument must be Date object') unless date.is_a?(Date)
        dates[date.year][method].include?(date)
      end

      define_method("#{method}s") do |year|
        has_data_for_year?(year)
        dates[year][method]
      end
    end

    def work?(date)
      raise ArgumentError unless date.is_a?(Date)
      !holidays(date.year).include?(date) #&& !shorts(date.year).include?(date)
    end

    def works(year)
      has_data_for_year?(year)
      (Date.new(year, 1, 1)..Date.new(year, 12, 31)).to_a - holidays(year) - shorts(year)
    end

    private
      def has_data_for_year?(year)
        raise ArgumentError.new('Data missing for that year') unless dates.keys.include?(year)
      end

      def dates
        @@dates ||= YAML.load_file(File.expand_path('../russian_workdays/dates.yml', __FILE__))
      end
  end
end