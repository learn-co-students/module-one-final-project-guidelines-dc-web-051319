require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

name_input = welcome
#welcomes user & gets user input
player = make_player(name_input)
#takes input to create user
deck_input = name_deck
#prompts deck namee
deck = make_deck(deck_input, player.id)
# creates deck instance
def make_carddeck(player)
  empty_deck =  player.decks.first.cards
    x = Card.all.sample(40)
    x.each do |card|
      empty_deck << card

    end

end

make_carddeck(player)

time_to_build

def here_deck(player)
  here = player.decks.first.cards
  here.each {|cards| puts cards.name}
end



here_deck(player)
def name_card
  puts "Choose a card to Put into your deck"
  gets.chomp
end

card_name = name_card
here = player.decks.first.cards

def add_single_card(card_name)

 here = player.decks.first.cards
  card = Card.find_by(name: card_name)
  if card
    here << card
    puts "You have added #{card.name}"
  else puts "card doesnt exist"


  end
end

add_single_card(card_name)
# asks user how he would like to add cards to his deck at random or by choice?
#
# if they decline random then user selects card by choice




# binding.pry
# 0





# welcome
# input = gets.chomp
# player = Player.find_or_create_by(name: input)
# name_deck
# deck_name = gets.chomp
# deck = Deck.find_or_create_by(name: deck_name, player_id: player.id)
# time_to_build
# deck_with_cards = []


# puts  "Hey Time build your deck, how many monster cards would you like?"

# y = gets.chomp
# get_monster_cards_from_api(y)
