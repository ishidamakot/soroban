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

      describe 'include minus number of 4' do
        it {
          nums = Addition.generate(include_minus: true).numbers
          minus_nums = nums.select{ |num| num < 0 }
          expect(minus_nums.size).to eq 4
        }
      end
    end
  end
end
