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
      erb :'recipes/new'
    end
  end

  #create
   post '/recipes' do
    recipe = Recipe.create(params[:recipe])
    recipe.user = @current_user
    redirect to "/recipes/#{recipe.id}"
   end

  #edit
  get '/recipes/:id/edit' do
    if !logged_in?
      redirect '/login'
    else
      id = params[:id]
      @recipe = Recipe.find_by(id: id)
    #  @recipe = current_user.recipes.find_by(params[:id])
      erb :'recipes/edit'
    end
  end

  #Update
  put '/articles/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.update(params[:recipe])
    redirect to "/recipes/#{recipe.id}"
  end

  #Destroy
  delete '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    @recipe.delete
    redirect to "/recipes"
  end


  #show
  get '/recipes/:id' do
    id = params[:id]
      @recipe = Recipe.find_by(id: id)
    erb :'recipes/show'
  end
end

#edit
