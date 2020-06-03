class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "recipes"
    end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(:user_email => session[:user_email]) if session[:user_email]
    end

    def login(user_email, password)
      #is the user who they claim to be
      user = User.find_by(:user_email => user_email)
      if user && user.authenticate(params[:password])
      session[:user_email] = user.user_email
      else
      redirect '/login'
      end
    end

    def logout!
      session.clear
    end
  end

  get '/' do
    erb :'sessions/test'
    end

end
