FactoryBot.define do
  factory :heart_rate do
    time_stamp {Time.now}
    bpm {1}
    confidence {1}
  end
end