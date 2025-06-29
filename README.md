# String Calculator (Ruby TDD)

A Ruby implementation of String Calculator using Test‑Driven Development (TDD).

## 🧪 Features

- `add("")` returns `0`
- `add("1")` returns `1`
- `add("1,2")` returns `3`
- Supports an arbitrary number of numbers
- Supports newlines as delimiters, e.g. `"1\n2,3"`
- Allows custom single-character delimiter syntax: `"//;\n1;2"`
- Throws an exception for negative numbers with a message listing all negatives
- Ignores numbers greater than 1000
- Supports multi-character delimiters: `"//[***]\n1***2***3"`

## Getting Started

### Prerequisites

- Ruby (≥ 2.5)
- Bundler (optional but recommended)

### Installation

```bash
git clone https://github.com/jaykava/string_calculator_ruby_tdd.git
cd string_calculator_ruby_tdd
bundle install   # if using Bundler
```

### Running Tests
```bash
rspec
```

### Usage
- You can manually use the calculator with:
```bash
require_relative 'string_calculator'

calc = StringCalculator.new
puts calc.add("1,2,3")  # => 6
```

### Project Structure

```bash
string_calculator_ruby_tdd/
└── lib/
    └── string_calculator.rb   # implementation
└── spec/
    └── string_calculator_spec.rb  # RSpec tests
```
### Examples

```bash
calc = StringCalculator.new
calc.add("")                           # => 0
calc.add("4")                          # => 4
calc.add("1,2,3,4")                    # => 10
calc.add("1\n2,3")                     # => 6
calc.add("//;\n2;5")                   # => 7
calc.add("2,1001")                     # => 2
calc.add("//[***]\n1***2***3")         # => 6
```
- Negative numbers:
```bash
calc.add("1,-2,3,-4")
# => raises RuntimeError: "negatives not allowed: -2, -4"
```