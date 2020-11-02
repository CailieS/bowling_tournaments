require 'pry'
class TournamentsController < ApplicationController
    get '/tournament/new' do 
        erb :'/tournaments/new'
       
    end

    post '/tournaments' do
        @tournament = Tournament.create(
            name: params[:name], 
            location: params[:location], 
            date: params[:date] )
            redirect "/tournament/#{@tournament.id}"
    end

    get '/tournament' do
        @tournaments = Tournament.all
        erb :'tournaments/index'
       
    end
    
    get '/tournaments/:id' do
        @tournament = Tournament.find(params[:id])
        erb :'tournaments/show'
    end

    get '/tournament/:id/edit' do
        @tournament = Tournament.find(params[:id])
        erb :'tournaments/edit'
    end

    patch '/tournament/:id' do
        @tournament = Tournament.find(params[:id])
        @tournament.name = params[:name]
        @tournament.location = params[:location], 
        @tournament.date = params[:date]
        @tournament.save
        redirect "/tournament/#{@tournament.id}"
    
    end

   delete '/tournament/:id/delete' do
        @tournament = Tournament.find(params[:id])
        @tournament.destroy
        redirect '/tournament'
   end 


end