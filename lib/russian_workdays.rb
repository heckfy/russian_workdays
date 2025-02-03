# frozen_string_literal: true

require 'yaml'
require 'date'
require_relative 'russian_workdays/collection'
require_relative 'russian_workdays/day'
require_relative 'russian_workdays/month'
require_relative 'russian_workdays/year'

module RussianWorkdays
  YAML_FILE = File.read(File.join(__dir__, 'dates.yml')).freeze
  DATES = YAML.safe_load(YAML_FILE, permitted_classes: [::Date, Symbol]).freeze

  private_constant :YAML_FILE
end
