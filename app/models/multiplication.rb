class Multiplication
  def initialize(multiplicand, multiplier)
    @multiplicand, @multiplier = multiplicand, multiplier
  end

  def answer
    @multiplicand * @multiplier
  end

  def self.generate
    new(0,0)
  end
end
