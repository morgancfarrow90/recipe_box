class RecipesController < ApplicationController

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :'recipes/index'
  end

  #new
  get '/recipes/new' do
    if !logged_in?
      redirect "/login"
    else
      "A new recipe form"
    end
  end

  #create

  #edit
  get '/recipes/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      id = params[:id]
      @recipe = current_user.recipes.find_by(id: id)
      #@recipe = current_user.recipes.find_by(params[:id])
      erb :'recipes/edit'
    end
  end


  #show
  get '/recipes/:id' do
    id = params[:id]
      @recipe = Recipe.find_by(id: id)
    erb :'recipes/show'
  end
end

#edit
