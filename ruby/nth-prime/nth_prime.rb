class Prime
  def self.prime?(n)
    (2...(n / 2 + 1)).none? { |i| (n % i).zero? }
  end

  def self.nth(n)
    raise ArgumentError if n < 1

    (2..).lazy.filter { |i| prime?(i) }.first(n)[-1]
  end
end
