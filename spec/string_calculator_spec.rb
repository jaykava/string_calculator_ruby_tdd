require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calc = StringCalculator.new
      expect(calc.add("")).to eq(0)
    end

    it 'returns the number itself if one number is passed' do
      calc = StringCalculator.new
      expect(calc.add("1")).to eq(1)
    end
  end
end