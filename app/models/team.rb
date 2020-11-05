class Team < ActiveRecord::Base
    has_secure_password
    has_many :tournament
    validates :name, presence: true, uniqueness: true
end

