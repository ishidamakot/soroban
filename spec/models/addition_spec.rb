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
    describe 'create 10 numbers' do
      it { expect(addition.numbers.size).to eq 10 }
      it { expect(addition.numbers).to all(be_a Integer) }
    end
    describe 'number is 8 digit' do
      it { addition.numbers.each { |num| expect(num.to_s.size).to eq 8 } }
    end
  end
end
