# frozen_string_literal: true

# Heart Rate Model
class HeartRate < Sequel::Model
  dataset_module do
    def last_time_stamp
      select(:time_stamp).order(:time_stamp).last
    end
  end
end
