class MealTypesController < ApplicationController

  #index
  get '/mealtypes' do
    @mealtypes = MealType.all
    erb :'meal_types/index'
  end
end
