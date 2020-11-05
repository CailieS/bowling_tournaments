require 'pry'
 class TeamsController < ApplicationController
 
   get '/teams/signup' do
      erb :'/teams/new'
   end 

   get '/teams/login' do
      # if session[:user_id]
      #     @team = Team.find(session[:user_id])
      #     redirect "/teams/#{@team.id}"
      #  else
          erb :'/teams/login'
      # end
    end

    get '/teams/logout' do
      session.clear
      redirect '/'
    end
    
    post '/teams/signup' do
      @team = Team.create(email: params[:email], password: params[:password], name: params[:name])
      session[:user_id] = @team.id
      #flash[:message] = "welcome back #{@team.name}"
      erb :'/teams/show'
   end 
    
    get '/teams/:id' do
      @team = Team.find_by(name: params[:name])
      erb :'/teams/show'
   end
   
   # post '/teams/signup' do
   #    @team = Team.create(email: params[:email], password: params[:password], name: params[:name])
   #    session[:user_id] = @team.id
   #    #flash[:message] = "welcome back #{@team.name}"
   #    erb :'/teams/show'
   # end 

   post '/teams/login' do
     
      @team = Team.find_by(name: params[:name])
      #binding.pry
      if @team && @team.authenticate(params[:password])
         
         session[:user_id] = @team.id
         #flash[:message] = "Welcome back #{@team.name} "
         redirect "/teams/#{@team.id}"
      else
         #flash[:error] = "Woops! Looks like you entered something wrong! Please try again."
         redirect "/teams/login"
      end
   end

  end