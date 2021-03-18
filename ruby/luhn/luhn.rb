# Luhn algorithm is a simple checksum formula used to check a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance
class Luhn
  def self.valid?(identification)
    new(identification).valid?
  end

  private

  attr_reader :id, :checksum

  def initialize(identification)
    @id = identification
    @checksum = normalized
  end

  def make_checksum(strings)
    strings.reverse.map.with_index.sum do |digit, index|
      next digit if index.even?

      digit *= 2
      digit -= 9 unless digit < 10
      digit
    end
  end

  def normalized
    string = id.gsub(' ', '')
    make_checksum(string.chars.map(&:to_i)) unless string =~ /\D/ || string.length < 2
  end

  public

  def valid?
    checksum && (checksum % 10).zero?
  end
end
