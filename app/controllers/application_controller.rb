require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'hella_secret_session'
  end

  get "/" do
    erb :'welcome'
  end
  
  helpers do
    def logged_in?
     !!session[:users_id]
    end

    def self.is_logged_in?(session)
      !!session[:user_id]
    end
  end

end