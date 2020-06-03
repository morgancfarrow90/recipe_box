class SessionsController < ApplicationController

  get '/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    login(params[:user_email], params[:password])
    redirect '/recipes'
  end

  get '/logout' do
    logout!
    erb :'sessions/logout'
  end

end
