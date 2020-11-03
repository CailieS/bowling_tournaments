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
            date: params[:date] )
            redirect "/tournaments/#{@tournament.id}"
    end

    get '/tournaments/:id' do
        @tournament = Tournament.find_by(params[:user_id])
        erb :'tournaments/show'
    end

    get '/tournaments/:id/edit' do
        @tournament = Tournament.find(params[:id])
        erb :'tournaments/edit'
    end

    patch '/tournaments/:id' do
        @tournament = Tournament.find(params[:id])
        @tournament.name = params[:name]
        @tournament.location = params[:location], 
        @tournament.date = params[:date]
        @tournament.save
        redirect "/tournament/#{@tournament.id}"
    
    end

   delete '/tournaments/:id/delete' do
        @tournament = Tournament.find(params[:id])
        @tournament.destroy
        redirect '/tournament'
   end 


end