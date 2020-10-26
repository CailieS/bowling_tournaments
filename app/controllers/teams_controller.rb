#require 'pry'
 class TeamsController < ApplicationController
 
   
    get '/team/new' do
       erb :'/teams/new'
    end       
    
    post '/team' do
      params.inspect
   #      @team = Team.create(
   #         teamname: params[:teamname], 
   #         password: params[:password])
   #      if @team.username == "" && @team.password == ""
   #         redirect "/team/new"
   #     else
   #       @team.save
   #    end
   #  sessions[:teams_id] = @team.id
   #     redirect "/team/#{@team.id}"
     end 

   #   get 'team/login' do
   #     erb :'/team/login'
   #   end

   #  post 'team/login' do
       #@team = Team.find_by(teamname: params[:teamname])
       
       #if @team && @team.authenticate(params[:password])
         #session[:teams_id] = @team.id
         #@redirect '/team/#{@team.id}'
      #else
         #redirect '/user/login'
   #  end
   #end

  
    get '/team/:id' do 
        #show page
        @team = Team.find(params[:id])
        erb :'/teams/show'
    end
 end