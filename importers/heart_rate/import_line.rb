# frozen_string_literal: true

module HR
  class ImportLine
    def initialize(line)
      @line = line
    end

    def call
      line = format_line
      return if HeartRate[time_stamp: line[:time_stamp]]

      HeartRate.create(line)
    end

    def format_line
      {
        time_stamp: HR::TimeStamp.new(@line['dateTime']).parse,
        bpm: @line['value']['bpm'],
        confidence: @line['value']['confidence']
      }
    end
  end
end
