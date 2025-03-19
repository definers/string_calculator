class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ",|\n"  # Default delimiters

    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = Regexp.escape(parts[0][2..-1])  # Extract custom delimiter
      numbers = parts[1]  # Remaining part with numbers
    end

    num_list = numbers.split(/#{delimiter}/).map(&:to_i)

    negatives = num_list.select { |num| num.negative? }
    raise "negative numbers not allowed #{negatives.join(',')}" unless negatives.empty?

    num_list.sum
  end
end
