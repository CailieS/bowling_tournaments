require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, 'secret'
  end

  get "/" do
    erb :'welcome'
  end

  helpers do
     def logged_in?
      !!session[:users_id]
     end
   end

end