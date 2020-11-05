require './config/environment'

class ApplicationController < Sinatra::Base
  
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "password_security"
  set :views, Proc.new { File.join(root, "../views/") }

  get "/" do
    erb :'welcome'
  end
  


  def current_user
    binding.pry
    @current_user ||= Team.find(session[:user_id]) if session[:user_id]
  end

    def logged_in?
     !!current_user
    end

    def invalid_credentials?(params)
      badChars = ["&", ",", "/", "#", "$", "%", "*", "(", ")", "!", "^", "\\", ":", ";", "=", "+", "?", "<", ">"]
      badChars.each do |bad_char|
          if ( (params[:name].include?(bad_char)) || (params[:email].include?(bad_char)) || (params[:password].include?(bad_char)) )
              return true
          end
      end
      return false
  end

  end

