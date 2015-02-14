require 'rails_helper'

RSpec.describe Exercise, type: :model do
  describe 'has 10 addtions and 20 multiplications and 20 divisions' do
    let(:exercise) { Exercise.new }
    it { expect(exercise.additions.size).to eq 10 } 
    it { expect(exercise.multiplications.size).to eq 20 } 
    it { expect(exercise.divisions.size).to eq 20 } 
  end

  describe '#generate' do
    let(:exercise) { Exercise.generate }
    describe 'return generared instance' do
      it { expect(exercise.additions).to all(be_a Addition) }
      it { expect(exercise.multiplications).to all(be_a Multiplication) }
      it { expect(exercise.divisions).to all(be_a Division) }
    end

    describe 'Addition is 6 positive and 4 negative into 1 minus answer' do
    end
  end
end
