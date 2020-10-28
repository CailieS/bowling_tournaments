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
         redirect "/team/#{@team.id}"
      else
         erb :'/teams/login'
      end
   end
   
   post '/team/login' do
      @team = Team.find_by(teamname: param[:teamname])
      if @team && @team.authenticate(params[:password])
         session[:user_id] = @team.id
         redirect "/team/#{@team.id}"
      else
         redirect "/team/login"
      end
   end

   get '/team/:id' do 
      @team = Team.find_by(params[:id])
      erb :'/teams/show'
   end

   get '/team/logout' do
       session.clear
       redirect '/'
   end
  end