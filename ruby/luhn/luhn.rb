# Luhn algorithm is a simple checksum formula used to validate a variety of identification numbers,
# such as credit card numbers and Canadian Social Insurance
class Luhn
  class << self
    private

    def checksum(identification_number)
      identification_number.reverse.map.with_index.sum do |digit, index|
        if index.even?
          digit
        elsif digit < 5
          digit * 2
        else
          (digit * 2) - 9
        end
      end
    end

    def normalized(identification_number)
      identification_number.chars.map(&:to_i)
    end

    def validate?(normalized_id_number)
      (checksum(normalized_id_number) % 10).zero?
    end

    def normalized_and_validate?(identification_number)
      normalized_id_number = normalized(identification_number)
      validate?(normalized_id_number)
    end

    public

    def valid?(identification_number)
      identification_number = identification_number.gsub(' ', '')

      return false if identification_number =~ /\D/
      return false if identification_number.length < 2

      normalized_and_validate?(identification_number)
    end
  end
end
