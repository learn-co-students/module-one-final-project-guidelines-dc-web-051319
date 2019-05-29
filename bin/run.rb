require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

name_input = welcome
#welcomes user & gets user input
player = make_player(name_input)
#takes input to create user
deck_input = name_deck
#prompts deck name
make_deck(deck_input, player.id)
#creates deck instance

#asks user how he would like to add cards to his deck at random or by choice?

#if they decline random then user selects card by choice

time_to_build


binding.pry
0





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
