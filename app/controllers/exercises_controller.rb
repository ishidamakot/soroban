class ExercisesController < ApplicationController
  def index
  end
  def new
    @exercise = Exercise.generate
  end
end
