class Addition
  attr_accessor :numbers

  def initialize(nums=[])
    self.numbers = nums
  end

  def answer
    self.numbers.inject(:+)
  end
    
  def self.generate(opts = {})
    if opts[:include_minus]
      nums = 6.times.map { generate_num } + 4.times.map { 0 - generate_num }
      new(nums.shuffle)
    else
      new(10.times.map { generate_num })
    end 
  end

  private

  def self.generate_num
    nums = [*'0'..'9'].shuffle[0,8]
    nums.first != '0' ? nums.join.to_i : generate_num
  end

end
