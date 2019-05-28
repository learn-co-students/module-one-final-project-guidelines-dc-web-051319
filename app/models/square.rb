class Square < ActiveRecord::Base
    belongs_to :restaurant
    belongs_to :board
end
