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
    recipe.user= current_user
    recipe.save
    redirect to "/recipes/#{recipe.id}"
   end

  #edit
  get '/recipes/:id/edit' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    current_user
    if !logged_in? || @recipe.user_id != @current_user.id
      flash[:no_access]= "Too many cooks in the kitchen! You can only make changes to your recipes!"
      redirect "/recipes"
    else

    #  @recipe = current_user.recipes.find_by(params[:id])
      erb :'recipes/edit'
    end
  end

  #Update
  put '/recipes/:id' do
    recipe = Recipe.find_by(id: params[:id])
    recipe.update(params[:recipe])
    redirect to "/recipes/#{recipe.id}"
  end

  #Destroy
  delete '/recipes/:id' do
    id = params[:id]
    @recipe = Recipe.find_by(id: id)
    current_user
    if !logged_in? || @recipe.user_id != @current_user.id
      flash[:no_access]= "Too many cooks in the kitchen! You can only make changes to your recipes!"
      redirect "/recipes"
    else
      @recipe.delete
      redirect to "/recipes"
  end
end

  #show
  get '/recipes/:id' do
    id = params[:id]
      @recipe = Recipe.find_by(id: id)
    erb :'recipes/show'
  end
end
