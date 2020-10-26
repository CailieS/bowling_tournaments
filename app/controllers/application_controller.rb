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

  Helpers do
    def logged_in?
      !!sessions[:teams_id]
    end
  end

end