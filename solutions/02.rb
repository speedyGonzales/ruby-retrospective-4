class NumberSet
  include Enumerable

  def initialize(numbers = [])
    @numbers = numbers
  end

  def each(&block)
    @numbers.each &block
  end

  def size
    @numbers.size
  end

  def empty?
    @numbers.empty?
  end

    def <<(number)
    @numbers << number unless @numbers.include? number
  end

  def [](filter)
    NumberSet.new @numbers.select { |number| filter.filtered? number }
  end
end

class Filter
  def initialize(&condition)
    @condition = condition
  end

  def filtered?(number)
    @condition.call number
  end

  def &(other)
    Filter.new { |number| filtered? number and other.filtered? number }
  end

  def |(other)
    Filter.new { |number| filtered? number or other.filtered? number }
  end
end

class TypeFilter < Filter
  def initialize(type)
    case type
    when :integer then super() { |number| number.is_a? Fixnum}
    when :real then super() { |number| number.is_a? Float or Rational}
    when :complex then super() { |number| number.is_a? Complex}
    end
  end
end

class SignFilter < Filter
  def initialize(sign)
    case sign
    when :positive     then super() { |number| number >  0 }
    when :non_positive then super() { |number| number <= 0 }
    when :negative     then super() { |number| number <  0 }
    when :non_negative then super() { |number| number >= 0 }
    end
  end
end
