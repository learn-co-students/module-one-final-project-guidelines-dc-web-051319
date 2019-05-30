require_relative '../config/environment'

def welcome
  puts "Hello, Welcome to YgoProDeck! "
  puts "Please enter your name:"
  gets.chomp
end

def make_player(name)
Player.create(name: name)

end

def name_deck
  puts "What would you like to name your deck?"
  gets.chomp
end

def make_deck(name, id)
  Deck.create(name: name, player_id: id)

end



def time_to_build
  puts "The cards in your deck will be gifted  to you at random,
  you will later be given the opportunity to add and remove cards from your deck!"
end

def make_card_deck(decks_id, cards_id)
  deck_card.create(deck_id: decks_id, card_id: cards_id)
end

def make_carddeck
    deck = Deck.all[1]
    x = Card.all.sample(40)
    # binding.pry
    x.each do |card|

    end

end
make_carddeck


#
# def check_reply
#   reply = time_to_build
#   binding.pry
# end

  # if reply == true
  #   x = Card.all.sample(40)
  #   x.each do |card|
  #     card.deck = deck1
  #   else puts "Okay you can select your deck by choice"




def deck_builder


end
