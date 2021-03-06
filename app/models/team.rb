require 'pry'
class Team < ActiveRecord::Base
    has_secure_password
    has_many :tournaments
    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end

