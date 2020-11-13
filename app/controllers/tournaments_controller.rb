require 'pry'
class TournamentsController < ApplicationController


  get '/tournaments' do
    @tournaments = Tournament.all
   
    erb :'tournaments/index'
  end

  get '/tournaments/new' do 
    #binding.pry
    erb :'/tournaments/new'
  end

  post '/tournaments' do
    empty_params = empty_fields?(params)
    if empty_params
      redirect '/tournaments'
    else
      
    @tournament = Tournament.create(
        name: params[:name], 
        location: params[:location], 
        date: params[:date],
        team_id: session[:team_id])
        #binding.pry
      redirect '/tournaments'
    end
  end

  get '/tournaments/:id' do
    @tournament = Tournament.find_by_id(params[:id])
    erb :'tournaments/show'
  end

  get '/tournaments/:id/edit' do
    
  
    @tournament = Tournament.find_by_id(params[:id])
    @team = Team.find_by_id(session[:team_id])
    
    if @tournament.team_id != @team.id
      redirect '/tournaments'
    else
        erb :'/tournaments/edit'
    end
  end

 
  patch '/tournaments/:id/edit' do
    @tournament = Tournament.find(params[:id])
    @tournament.update(
      name: params[:name], 
      location: params[:location], 
      date: params[:date])
      redirect "/tournaments/#{@tournament.id}"
      erb :'tournaments/index'
    
  end

   delete '/tournaments/:id/delete' do
    @tournament = Tournament.find_by_id(params[:id])
    @tournament.delete
    redirect '/tournaments'
   end 

end