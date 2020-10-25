class Team < ActiveRecord::Base
    has_secure_password
    has_many :tournament

   



    # def call(req)
    #     request = Rack::Request.new(req)
    #     response = Rack::Response.new
    #     if request.path == '/'
    #         response.write "Welcome to Let's Go Bowling!"
    #     end
    #     response.finish
    # end

end

