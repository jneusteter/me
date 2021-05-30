# frozen_string_literal: true

describe HR::TimeStamp do
  let(:unparsed_date) { '11/23/19 20:09:09' }

  describe '#parse' do
    it 'parses date into time stamp' do
      parsed_date = described_class.new(unparsed_date).parse
      expect(parsed_date).to eql('2019-11-23T20:09:09+00:00')
    end
  end

  describe '#date' do
    it 'returns formated date' do
      date = described_class.new(unparsed_date).date
      expect(date).to eql('2019-11-23')
    end
  end

  describe '#time' do
    it 'returns time unchanged' do
      time = described_class.new(unparsed_date).time
      expect(time).to eql('20:09:09')
    end
  end
end
