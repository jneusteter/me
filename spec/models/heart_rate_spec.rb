describe HeartRate do
  describe '#last date' do
    let(:time_stamp) { DateTime.parse(described_class.last_time_stamp[:time_stamp].to_s) }

    it 'return the last time stamp in the database' do
      create(:heart_rate, time_stamp: '2020-01-02 01:01:01+00')
      create(:heart_rate, time_stamp: '2020-01-01 01:01:01+00')
      expect(time_stamp.day).to eql(2)
    end
  end
end