class Card < ActiveRecord::Base
<<<<<<< HEAD
    # has_many :decks
    # belongs_to :player, through: :deck
=======
  has_many :decks
  has_many :players, through: :decks
>>>>>>> 77d3130706604b53628521848ad35cd080c2ba3e
end
