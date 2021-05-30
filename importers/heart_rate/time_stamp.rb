# frozen_string_literal: true

module HR
  class TimeStamp
    def initialize(date)
      @date = date
    end

    def parse
      DateTime.parse("#{date}T#{time}UTC").to_s
    end

    def date
      split = @date.split[0].split('/')
      "20#{split[2]}-#{split[0]}-#{split[1]}"
    end

    def time
      @date.split[1]
    end
  end
end
