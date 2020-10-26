class TournamentsController < ApplicationController
    get '/tournaments/new' do 
        erb :'/tournaments/new'
       
    end

    post '/tournaments' do
        "Process our form"
    end
end