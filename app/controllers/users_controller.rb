class UsersController < ApplicationController

  get '/signup' do
    erb :'users/new'
  end

  post '/users' do
    @user = User.new
    @user.user_email = params[:user_email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :'users/new'
    end
  end
end
