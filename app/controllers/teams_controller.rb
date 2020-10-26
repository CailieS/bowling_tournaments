 class TeamsController < ApplicationController
 
   
    get '/team/signup' do
       erb :'/teams/signup'
    end       
    
    post '/team/signup' do
      params.inspect
        #params[:teamname]
        #params[:password]
        @team = Team.create(teamname: params[:teamname], password: params[:password])
      redirect "/team/#{@team.id}"
    end 
  
    get '/team/:id' do 
        #show page
        @team = Team.find(params[:id])
        erb :'/teams/show'
    end
 end