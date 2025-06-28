class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

		number_list = parse_numbers(numbers)
    number_list.sum
  end

  private

  def parse_numbers(numbers)
    delimiters = /,|\n/

    numbers.split(delimiters).map(&:to_i)
  end
end