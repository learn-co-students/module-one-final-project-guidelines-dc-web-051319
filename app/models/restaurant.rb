class Restaurant < ActiveRecord::Base
    has_many :visits
    has_many :squares
end
