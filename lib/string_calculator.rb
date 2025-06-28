class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

		number_list = parse_numbers(numbers)
    number_list.sum
  end

  private

  def parse_numbers(numbers)
    default_delimiters = /,|\n/
    delimiter_regex = default_delimiters

    #supports "//<delimiter>\n" for now
    if numbers.start_with?("//")
      matched = numbers.match(%r{//(.)\n(.*)})
      custom_delimiter = matched[1]
      numbers = matched[2]
      delimiter_regex = Regexp.new(Regexp.escape(custom_delimiter))
    end

    numbers.split(delimiter_regex).map(&:to_i)
  end
end