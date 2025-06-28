require_relative '../lib/string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calc) { StringCalculator.new }
    it 'returns 0 for an empty string' do
      expect(calc.add("")).to eq(0)
    end

    it 'returns the number itself if one number is passed' do
      expect(calc.add("1")).to eq(1)
    end

    it 'returns the sum if two numbers are passed separated by comma' do
      expect(calc.add("1,5")).to eq(6)
    end

    it 'returns the sum of unlimited numbers' do
      expect(calc.add("1,2,3")).to eq(6)
      expect(calc.add("4,5,6,7,8")).to eq(30)
    end

    it 'supports newlines(\n) as delimiters along with commas' do
      expect(calc.add("1\n2,3")).to eq(6)
      expect(calc.add("4\n5\n6")).to eq(15)
    end

    it 'supports custom single-character delimiters which is define by ("//<delimiter>\n")' do
      expect(calc.add("//;\n1;2")).to eq(3)
      expect(calc.add("//@\n2@3")).to eq(5)
      expect(calc.add("//#\n5#6#4")).to eq(15)
    end

    it 'raises an exception if a negative number is included' do
      expect { calc.add("1,-2,3") }.to raise_error(RuntimeError, "negatives not allowed: -2")
    end

    it 'shows all negative numbers in the exception message' do
      expect { calc.add("1,-2,-4,5\n-7") }.to raise_error(RuntimeError, "negatives not allowed: -2, -4, -7")
    end

    it 'method get_called_count tracks how many times add() was called' do
      calc.add("1,2")
      calc.add("3")
      expect(calc.get_called_count).to eq(2)
    end
  end
end