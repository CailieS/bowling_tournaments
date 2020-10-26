class TournamentsController < ApplicationController
    get '/tournament/new' do 
        erb :'/tournaments/new'
       
    end

    post '/tournament' do
        @tournament = tournament.create(
            address: params[:address], 
            location: params[:location], 
            date: params[:date]
                    )
        redirect "/tournament/#{@tournament.id}"
    end

    get '/tournament/:id' do
        @tournament = Tournament.find(params[:id])
        erb :'tournament/show'
    end

    get '/tournament' do
        @tournaments = Tournament.all
        erb :'/tournament/index'
    end

    get '/tournament/:id/edit' do
        @tournament = Tournament.find(params[:id])
        erb :'/tournament/edit'
    end

    post '/tournament/:id' do
        @tournament = Tournament.find(params[:id])
        @tournament.update(
        address: params[:address], 
        location: params[:location], 
        date: params[:date]
                )
        redirect "/tournament/#{@tournament.id}"
    end

   delete '/tournament/:id' do
    @tournament = Tournament.find(params[:id])
    @tournament.destroy
    redirect '/tournament'
   end 


end