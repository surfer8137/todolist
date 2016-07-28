require 'csv'
require './lib/csv_vars'

class CSVMaker
  class << self
    def make
      csv_text = ''
      CSV.open(CSVVars::DEFAULT_PATH, "wb") do |csv|
        csv << Task.attribute_names
        csv_text << Task.attribute_names.join(',')
        Task.all.each do |task|
          csv << task.attributes.values
          csv_text << task.attributes.values.join(',')
        end
        csv_text
      end
    end
  end
end
