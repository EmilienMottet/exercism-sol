# Luhn algorithm is a simple checksum formula used to check a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance
class Luhn
  def self.valid?(identification_number)
    numbers = identification_number.gsub(' ', '')

    return false if numbers =~ /\D/
    return false if numbers.length < 2

    normalized_and_check?(numbers)
  end

  class << self
    private

    def checksum(identification_number)
      identification_number.reverse.map.with_index.sum do |digit, index|
        next digit if index.even?

        digit *= 2
        digit -= 9 unless digit < 10
        digit
      end
    end

    def normalized(identification_number)
      identification_number.chars.map(&:to_i)
    end

    def check?(normalized_id_number)
      (checksum(normalized_id_number) % 10).zero?
    end

    def normalized_and_check?(identification_number)
      normalized_id_number = normalized(identification_number)
      check?(normalized_id_number)
    end
  end
end
