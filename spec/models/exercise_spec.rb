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
      it {
        include_minus = exercise.additions.select{ |add|
          not add.include_minus?
        }
        expect(include_minus.size).to eq 6
      }
      it {
        include_minus = exercise.additions.select{|add|add.include_minus?}
        expect(include_minus.size).to eq 4
      }
      it {
        minus_answer = exercise.additions.select{|add|add.minus_answer?}
        expect(minus_answer.size).to eq 1
      }
    end
  end
end
