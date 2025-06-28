class StringCalculator

  def initialize
    @call_count = 0
  end

  def add(numbers)
    @call_count += 1
    return 0 if numbers.empty?

		number_list = parse_numbers(numbers)
    number_list.sum
  end

  def get_called_count
    @call_count
  end

  private

  def parse_numbers(numbers)
    default_delimiters = /,|\n/
    delimiter_regex = default_delimiters

    if numbers.start_with?("//")
      if numbers =~ %r{//\[(.+)\]\n(.*)}m
        # Multi-char delimiter like //[***]\n
        custom_delimiter = $1
        numbers = $2
        delimiter_regex = Regexp.new(Regexp.escape(custom_delimiter))
      else
        #supports "//<delimiter>\n" for now
        matched = numbers.match(%r{//(.)\n(.*)})
        custom_delimiter = Regexp.escape(matched[1])
        numbers = matched[2]
        delimiter_regex = Regexp.new(custom_delimiter)
      end
    end

    num_list = numbers.split(delimiter_regex).map(&:to_i)

    negatives = num_list.select { |n| n < 0 }
    unless negatives.empty?
      raise "negatives not allowed: #{negatives.join(', ')}"
    end

    num_list.reject { |n| n > 1000 }
  end
end