# frozen_string_literal: true

module HR
  class Import
    def initialize
      @files = Dir['MyFitbitData/**/heart_rate*.json']
    end

    def import
      date = last_date
      @files.each do |file|
        ProcessFile.new(file, date).process
      end
    end

    def last_date
      date = HeartRate.last_time_stamp
      date ? date[:time_stamp].to_date : Date.new(1970, 1, 1)
    end
  end
end
