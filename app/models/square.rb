class Square < ActiveRecord::Base
    belongs_to :restaurant, optional: true
    belongs_to :board
end
