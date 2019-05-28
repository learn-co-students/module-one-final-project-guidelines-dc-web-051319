class Restaurant < ActiveRecord::Base
    has_many :vists
    has_many :squares
end
