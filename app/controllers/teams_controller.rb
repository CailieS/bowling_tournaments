require 'pry'
 class TeamsController < ApplicationController
 
   
    get '/team/new' do
      #@team = Team.create
       erb :'/teams/new'
    end       
    
    post '/team' do
      #params.inspect
       @team = Team.create(email: params[:email], password: params[:password], name: params[:teamname])
         if @team.name == "" && @team.password == ""
            redirect "/team/new"
         else
            @team.save
         end
       session[:user_id] = @team.id
       redirect "/team/#{@team.id}"
     end 

   get 'team/login' do
      if !logged_in?
            erb :'/team/login'
      else
           @team = Team.find(session[:user_id])
            redirect "/team/#{@team.id}"
     end
   end

    post 'team/login' do
       @team = Team.find_by(name: params[:name])
       if @team && @team.authenticate(params[:password])
         session[:user_id] = @team.id
         redirect '/team/#{@team.id}'
      else
         redirect '/team/login'
      end
   end

  
    get '/team/:id' do 
        #show page
        @team = Team.find_by(params[:id])
        #binding.pry
        erb :'/teams/show'
    end

    get '/team/logout' do
       session.clear
       redirect '/'
    end
  end