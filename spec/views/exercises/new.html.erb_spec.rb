require 'rails_helper'

RSpec.describe "exercises/new.html.erb", type: :view do
  describe 'render question and answer' do
    it {
      render
      expect(rendered).to match '問題'
      expect(rendered).to match '解答'
    }
  end
end
