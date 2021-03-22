# Luhn algorithm is a simple checksum formula used to check a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance
class Luhn
  def self.valid?(identification)
    new(identification).valid?
  end

  private

  attr_reader :id, :checksum

  def initialize(identification)
    @id = identification.gsub(' ', '')
    @checksum = normalized
  end

  def make_checksum(digits)
    digits.reverse.each_slice(2).sum do |(even, odd)|
      odd = 0 if odd.nil?
      odd *= 2
      odd -= 9 unless odd < 10
      even + odd
    end
  end

  def valid_format?
    id !~ /\D/ && id.length >= 2
  end

  def normalized
    make_checksum(id.chars.map(&:to_i)) if valid_format?
  end

  public

  def valid?
    checksum && (checksum % 10).zero?
  end
end
