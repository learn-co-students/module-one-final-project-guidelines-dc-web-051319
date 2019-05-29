class Deck < ActiveRecord::Base
<<<<<<< HEAD
    # belongs_to :player
    # # has_many :c
=======
  
  belongs_to :card
  belongs_to :player
>>>>>>> 77d3130706604b53628521848ad35cd080c2ba3e
end
