class Addition
  attr_accessor :numbers

  def initialize(nums=[])
    self.numbers = nums
  end

  def answer
    self.numbers.inject(:+)
  end
    
  def self.generate
    self.new Array.new(10) { generate_num }
  end

  private

  def self.generate_num
    nums = [*'0'..'9'].shuffle[0,8]
    nums.first != '0' ? nums.join.to_i : generate_num
  end

end
