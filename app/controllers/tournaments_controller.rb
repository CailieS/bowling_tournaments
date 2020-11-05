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
        #@team = find
        @tournament = Tournament.create(
            name: params[:name], 
            location: params[:location], 
            date: params[:date],
            user_id: session[:user_id])
            #redirect "/tournaments/#{@tournament.id}"
            erb :'/tournaments/show'
    end

    get '/tournaments/:id' do
        @tournament = Tournament.find_by_id(params[:id])
        #binding.pry
        erb :'tournaments/show'
    end

    get '/tournaments/:id/edit' do
        @tournament = Tournament.find_by_id(params[:id])
        #binding.pry
        @team = Team.find_by_id(session[:user_id])
      if logged_in? && @team == current_user
        erb :'/tournaments/edit'
      else
        redirect to '/tournaments'
      end
    end

    patch '/tournaments/:id' do
        @tournament = Tournament.find(params[:id])
        @tournament.name = params[:name]
        @tournament.location = params[:location], 
        @tournament.date = params[:date]
        @tournament.save
        redirect "/tournaments/#{@tournament.id}"
    
    end

   delete '/tournaments/:id/delete' do
     #binding.pry
        @tournament = Tournament.find_by_id(params[:id])
        @tournament.delete
        redirect '/tournaments'
   end 


end