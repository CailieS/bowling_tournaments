 class TeamsController < ApplicationController
 
   
    get '/teams/signup' do
       erb :'/teams/signup'
    end       
    
    post '/teams/signup' do
        #params[:teamname]
        #params[:password]
        @team = Team.create(teamname: params[:teamname], password: params[:password])
      redirect "/teams/#{@team.id}"
    end 
  
    get '/users/:id' do 
        #show page
        @team = Team.find(params[:id])
        erb :'/teams/show'
    end
 end