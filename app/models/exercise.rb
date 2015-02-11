class Exercise
  attr_accessor :kake, :wari, :mitori

  def self.generate
    exercise = Exercise.new
    exercise.kake = Array.new(20)
    exercise.wari = Array.new(20)
    exercise.mitori = { q: Array.new(10).fill{ generate_mitori }, a: nil}
    exercise
  end

  private

  def self.generate_mitori
    srand
    line = [*'0'..'9'].shuffle
    line.first != '0' ? line[0, 8].join.to_i : generate_mitori
  end
end
