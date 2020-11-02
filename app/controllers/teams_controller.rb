require 'pry'
 class TeamsController < ApplicationController
 
   
   get '/team/new' do
      erb :'/teams/new'
     
   end 

   post '/teams/signup' do
      @team = Team.create(email: params[:email], password: params[:password], name: params[:teamname])
      session[:user_id] = @team.id
      #flash[:message] = "welcome back #{@team.name}"
      erb :'/teams/show'
      
   end 

   get '/teams/:id' do 
      team = Team.find_by(params[:user_id])
      redirect '/tournaments/new'
   end
   
   get '/team/login' do
       erb :'/teams/login'
   end

   
   post '/teams/login' do
      @team = Team.find_by(name: params[:name])
      if @team && @team.authenticate(params[:password])
         session[:user_id] = @team.id
         #flash[:message] = "Welcome back #{@team.name} "
         redirect "/team/#{team.id}"
      else
         #flash[:error] = "Woops! Looks like you entered something wrong! Please try again."
         redirect "/team/login"
      end
   end

 
   get '/team/logout' do
       session.clear
       redirect '/'
   end

  end