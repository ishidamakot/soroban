class Exercise
  attr_accessor :additions, :multiplications, :divisions

  def initialize
    self.additions = Array.new(10)
    self.multiplications = Array.new(20)
    self.divisions = Array.new(20)
  end

  def self.generate
    exercise = self.new
    additions = 6.times.map { Addition.generate } +
      4.times.map { Addition.generate include_minus: true }
    exercise.additions = additions.shuffle
    exercise.multiplications.fill { Multiplication.generate }
    exercise.divisions.fill { Division.generate }
    exercise
  end
end
