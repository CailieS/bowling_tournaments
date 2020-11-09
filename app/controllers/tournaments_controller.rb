require 'pry'
class TournamentsController < ApplicationController


  get '/tournaments' do
    @tournaments = Tournament.all
    erb :'tournaments/index'
  end

  get '/tournaments/new' do 
    erb :'/tournaments/new'
  end

  post '/tournaments' do
    @tournament = Tournament.create(
        name: params[:name], 
        location: params[:location], 
        date: params[:date],
        user_id: session[:user_id])
    erb :'/tournaments/show'
  end

  get '/tournaments/:id' do
    @tournament = Tournament.find_by_id(params[:id])
    erb :'tournaments/show'
  end

  get '/tournaments/:id/edit' do
    @tournament = Tournament.find_by_id(params[:id])
    @team = Team.find_by_id(session[:user_id])
    if logged_in? && @team == current_user
        erb :'/tournaments/edit'
    else
        redirect '/tournaments'
    end
  end

  patch '/tournaments/:id/edit' do
    @tournament = Tournament.find(params[:id])
    @tournament.update(
      name: params[:name], 
      location: params[:location], 
      date: params[:date])
    redirect "/tournaments/#{@tournament.id}"
  end

   delete '/tournaments/:id/delete' do
    @tournament = Tournament.find_by_id(params[:id])
    @tournament.delete
    redirect '/tournaments'
   end 

end