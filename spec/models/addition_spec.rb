require 'rails_helper.rb'

RSpec.describe Addition, type: :model do
  let(:addition) { Addition.new(nums) }
  describe '#answer is sum of numbers' do
    subject { addition.answer }
    context 'at 1..10' do
      let(:nums) { [*1..10] }
      it { is_expected.to eq 55 }
    end
    context 'at other nums' do
      let(:nums) { [100,200,300,-50,400,500,-80,600,700,800] }
      it { is_expected.to eq 3470 }
    end
  end

  describe '#generate' do
    let(:addition) { Addition.generate }
    subject { addition }

    it { is_expected.to be_is_a(Addition) }

    describe 'generated numers' do
      let(:numbers) { addition.numbers }
      subject { numbers }

      it { expect(numbers.size).to eq 10 }
      it { is_expected.to all(be_a Integer) }

      describe 'is 8 digits at all' do
        be_8_digit = -> num { num.abs.to_s.size == 8 }
        it { is_expected.to all(satisfy &be_8_digit) }
      end

      context 'with include minus option' do
        nums = Addition.generate(include_minus: true).numbers
        minus_nums = nums.select{ |num| num < 0 }
        it { expect(minus_nums.size).to eq 4 }
      end

      context 'with minus answer option' do
        addition = Addition.generate include_minus: true, minus_answer: true
        it { expect(addition.answer).to be < 0 }
      end

      context 'without minus answer option' do
        additions = 100.times.map { Addition.generate include_minus: true }
        it { expect(additions).to all(satisfy {|add|add.answer >= 0}) }
      end
    end
  end

  describe '#include_minus?' do
    let(:nums) { [100] * 10 }
    subject { addition }
    it { is_expected.to_not be_include_minus }
    it {
      addition.numbers[0] = -100
      is_expected.to be_include_minus
    }
  end

  describe '#minus_answer?' do
    let(:nums) { [1,1,1,1,1,1,1,1,1,-10] } # sum is -1
    subject { addition }
    it { is_expected.to be_minus_answer }
  end
end
