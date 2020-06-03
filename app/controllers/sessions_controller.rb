class SessionsController < ApplicationController

  get '/login' do
    @error_message = params[:error]
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
