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
      if opts[:minus_answer]
        nums.inject(:+) < 0 ? new(nums.shuffle) : generate(opts)
      else
        nums.inject(:+) >= 0 ? new(nums.shuffle) : generate(opts)
      end
    else
      new(10.times.map { generate_num })
    end 
  end

  def include_minus?
    @numbers.select{|num|num < 0}.present?
  end

  private

  def self.generate_num
    nums = [*'0'..'9'].shuffle[0,8]
    nums.first != '0' ? nums.join.to_i : generate_num
  end

end
