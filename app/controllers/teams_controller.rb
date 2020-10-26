
 class TeamsController < ApplicationController
 
   
    get '/team/new' do
       erb :'/teams/new'
    end       
    
    post '/team' do
      params.inspect
       #@team = Team.create(teamname: params[:teamname], password: params[:password])
        #binding.pry
      #redirect "/team/#{@team.id}"
    end 
  
    get '/team/:id' do 
        #show page
        @team = Team.find(params[:id])
        erb :'/teams/show'
    end
 end