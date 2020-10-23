 class TeamsController < ApplicationController
 #CREATE a team-
     #New  
        #make a get request to '/teams/new'
    #Create
        #make a post request to '/teams'

    #READ
    get '/teams' do
        @teams = Teams.all
       erb :'teams/index'
    end       
    
    #Index 
        #make a get request to '/teams'

        #Show 
        #make a get request to '/teams/:id'
    
    #UPDATE a tournament
        #edit
            #make a get request to '/teams/:id/edit'
        #update
            #make a patch request to '/teams/:id'

    #DELETE a tournament
        #make a delete request to ,/recepies/:id'

 end