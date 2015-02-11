class ExercisesController < ApplicationController
  def new
    @exercise = Exercise.generate
  end
end
