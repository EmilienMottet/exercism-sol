class SpaceAge
  EARTH_UNIT = 365.25 * 24 * 60 * 60
  VENUS_UNIT = EARTH_UNIT * 0.61519726
  MARS_UNIT = EARTH_UNIT * 1.8808158
  NEPTUNE_UNIT = EARTH_UNIT * 164.79132
  JUPITER_UNIT = EARTH_UNIT * 11.862615
  SATURN_UNIT = EARTH_UNIT * 29.447498
  URANUS_UNIT = EARTH_UNIT * 84.016846
  MERCURY_UNIT = EARTH_UNIT * 0.2408467

  attr_reader :age

  def initialize(age)
    @age = age
  end

  constants.each { |x| define_method("on_#{x[0..-6].downcase}") { age / self.class.const_get(x) } }
end
