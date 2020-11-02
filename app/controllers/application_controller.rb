require './config/environment'

class ApplicationController < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'hella_secret_session'
    #register Sinatra::Flash
  end

  get "/" do
    erb :'welcome'
  end
  
  # helpers do
  #   def current_user
  #    Team.find_by(id: session[:team_id])
  #   end

  #   def self.is_logged_in?(session)
  #     !!session[:team_id]
  #   end
  # end

end