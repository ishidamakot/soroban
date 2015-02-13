require 'rails_helper.rb'

RSpec.describe Multiplication do
  describe '#answer' do
    multiplication = Multiplication.new(3, 4)
    it { expect(multiplication.answer).to eq(12) }
  end
end
