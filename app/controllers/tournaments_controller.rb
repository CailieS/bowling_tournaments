require 'pry'
class TournamentsController < ApplicationController
    get '/tournament/new' do 
        erb :'/tournaments/new'
       
    end

    post '/tournament' do
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
    
    get '/tournament/:id' do
        @tournament = Tournament.find(params[:id])
        erb :'tournaments/show'
    end

    patch '/tournament/:id' do
        @tournament = Tournament.find(params[:id])
        @tournament.update(
        name: params[:name], 
        location: params[:location], 
        date: params[:date])
        redirect "/tournaments/#{@tournament.id}"
    end

    post '/tournament/:id/edit' do
        @tournament = Tournament.find(params[:id])
        erb :'tournaments/edit'
    end

   delete '/tournament/:id/delete' do
        @tournament = Tournament.find(params[:id])
        @tournament.delete
        redirect '/tournament'
   end 


end