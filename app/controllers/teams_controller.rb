require 'pry'
 class TeamsController < ApplicationController
 
   get '/team/new' do
      erb :'/teams/new'
   end 

   post '/team' do
      @team = Team.create(email: params[:email], password: params[:password], name: params[:teamname])
      
      session[:user_id] = @team.id
      redirect "/team/#{@team.id}"
   end 
   
   get '/team/login' do
      if logged_in?
         @team = Team.find(session[:id])
         session[:user_id] = @team.id
         redirect "/team/#{@team.id}"
      else
         erb :'/teams/login'
      end
   end

   get '/login' do 
      erb :'teams/login' 
   end
   
   post '/login' do
      team = Team.find_by(name: params[:name])
      if team && team.authenticate(params[:password])
         session[:team_id] = team.id
      else
         redirect "/team/login"
      end
   end

   get '/team/:id' do 
      team = Team.find_by(params[:user_id])
      erb :'/teams/show'
   end

   get '/team/logout' do
       session.clear
       redirect '/'
   end

  end