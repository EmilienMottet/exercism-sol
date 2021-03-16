# frozen_string_literal: true

class Bob
  def self.hey(remark)
    remark = remark.strip
    if silence?(remark)
      'Fine. Be that way!'
    elsif shooting_asking?(remark)
      "Calm down, I know what I'm doing!"
    elsif asking?(remark)
      'Sure.'
    elsif shooting(remark)
      'Whoa, chill out!'
    else
      'Whatever.'
    end
  end

  def self.asking?(remark)
    remark[-1] == '?'
  end

  def self.shooting_asking?(remark)
    asking?(remark) and shooting(remark)
  end

  def self.silence?(remark)
    remark.empty?
  end

  def self.shooting(remark)
    remark == remark.upcase and remark != remark.downcase
  end
end
