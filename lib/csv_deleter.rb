require './lib/csv_vars'
require 'fileutils'

class CSVDeleter
  class << self
    def delete
      FileUtils.rm(CSVVars::DEFAULT_PATH)
    end
  end
end
