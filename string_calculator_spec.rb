require 'rspec'
require_relative 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    it 'returns 0 for an empty string' do
      expect(StringCalculator.add("")).to eq(0)
    end

    it 'returns the number itself for a single number' do
      expect(StringCalculator.add("5")).to eq(5)
    end

    it 'returns the sum of two numbers separated by a comma' do
      expect(StringCalculator.add("1,2")).to eq(3)
    end

    it 'handles new lines between numbers' do
      expect(StringCalculator.add("1\n2,3")).to eq(6)
    end

    it 'supports different delimiters specified at the beginning' do
      expect(StringCalculator.add("//;\n1;2")).to eq(3)
    end

    it 'throws an exception for a negative number' do
      expect { StringCalculator.add("1,-2,3") }.to raise_error("negative numbers not allowed -2")
    end

    it 'throws an exception listing all negative numbers' do
      expect { StringCalculator.add("1,-2,-3,4") }.to raise_error("negative numbers not allowed -2,-3")
    end
  end
end
