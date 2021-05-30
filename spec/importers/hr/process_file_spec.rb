# frozen_string_literal: true

describe HR::ProcessFile do
  let(:file) { 'MyFitbitData/name/Physical Activity/heart_rate-2019-11-23.json' }

  describe '#file_date' do
    let(:date) { described_class.new(file, Time.now).file_date }

    it { expect(date).to eql(Date.parse('2019-11-23')) }
  end

  describe '#process_file?' do
    it 'returns true when file date is newer than the last date' do
      value = described_class.new(file, Date.parse('2019-11-20')).process_file?
      expect(value).to be(true)
    end

    it 'returns true if file date and last date are the same' do
      value = described_class.new(file, Date.parse('2019-11-23')).process_file?
      expect(value).to be(true)
    end

    it 'returns true if file date one day older than last date' do
      value = described_class.new(file, Date.parse('2019-11-24')).process_file?
      expect(value).to be(true)
    end

    it 'returns false when file date is older than last date' do
      value = described_class.new(file, Date.parse('2019-11-25')).process_file?
      expect(value).to be(false)
    end
  end
end
