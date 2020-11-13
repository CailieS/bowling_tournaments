
require 'pry'
 class TeamsController < ApplicationController
 
   get '/teams/signup' do
      erb :'/teams/new'
   end 

   get '/teams/login' do
      erb :'/teams/login'
   end

    get '/teams/logout' do
      session.clear
      redirect '/'
    end
    
   post '/teams/signup' do
      if invalid_credentials?(params)
         #flash[:message] = "Looks like you entered something wrong! Please try again."
         redirect '/teams/signup'
      else
         @team = Team.create(email: params[:email], password: params[:password], name: params[:name])
         session[:team_id] = @team.id
         #flash[:message] = "welcome back #{@team.name}"
         erb :'/teams/show' 
     end
   end 
    
    get '/teams/:id' do
      @team = Team.find(params[:id])
      erb :'/teams/show'
   end


   post '/teams/login' do
     @team = Team.find_by(name: params[:name])
      
      if @team && @team.authenticate(params[:password])
         session[:team_id] = @team.id
         #flash[:message] = "Welcome back #{@team.name} "
         redirect "/teams/#{@team.id}"
      else
         #flash[:error] = "Woops! Looks like you entered something wrong! Please try again."
         redirect "/teams/login"
      end
   end

  end