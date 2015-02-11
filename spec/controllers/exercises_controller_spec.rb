require 'rails_helper'

RSpec.describe ExercisesController, type: :controller do
  describe "new" do
    it "renders the `new` template" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it 'assigns @exercise' do
      get :new
      expect(assigns(:exercise)).to be_is_a(Exercise)
    end
  end
end
