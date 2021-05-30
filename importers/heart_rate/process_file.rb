# frozen_string_literal: true

module HR
  class ProcessFile
    include Parsable

    def initialize(file, last_date)
      @file = file
      @last_date = last_date
    end

    def process
      return unless process_file?

      json(@file).each do |line|
        ImportLine.new(line).call
      end
    end

    def file_date
      Date.parse(File.basename(@file, '.*').gsub('heart_rate-', ''))
    end

    def process_file?
      file_date >= @last_date - 1
    end
  end
end
