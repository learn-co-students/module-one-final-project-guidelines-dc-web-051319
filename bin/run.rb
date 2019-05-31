require_relative '../config/environment'
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'tty-prompt'

#welcomes user & gets user input
name_input = welcome

puts "\n"

#takes input to create user
player = make_player(name_input)


#prompts deck name
deck_input = name_deck

# creates deck instance
deck = make_deck(deck_input, player.id)


make_carddeck(player)

puts "\n"

time_to_build

here_deck(player)

<<<<<<< HEAD
puts "\n"

card_to_add = add_card_prompt
add = add_single_card(card_to_add, player)

puts "\n"
=======


def add_single_card(card_name, player)
 here = player.decks.first.cards
  card = Card.find_by(name: card_name)
  if card
    here << card
    puts "You have added #{card.name}"
    # binding.pry
  else puts "card doesnt exist"
  end
end

add_single_card(card_name, player)

def remove_card(card_name, player)
  here = player.decks.first.cards
   card = here.find_by(name: card_name)
   if card
     here.delete(card)
     puts "You have deleted #{card.name}"
   else puts "Either you don't want to remove a card or it doesn't exist in your deck"
   end
end

def remove_card_prompt
 puts  "Time to remove a card"
  gets.chomp
end
>>>>>>> cd6eed2397647c20d135554228ed33613110ce27

card_to_delete = remove_card_prompt
remove_card(card_to_delete, player)

def find_strongest_card_prompt
  "Heres the strongest card."

end


def find_strongest_attack_card(player)


  cardi = player.decks.first.cards.each {|card| card.attack}
  # binding.pry
end

end

find_strongest_card_prompt

find_strongest_attack_card(player)


atk = find_highest_attack(player)

defense = find_highest_defense(player)

lvl = find_highest_level(player)

prompt = TTY::Prompt.new

puts "\n"

choices = {"Card With Highest Attack" => atk, "Card With Highest Defense" => defense, "Card With Highest Level" => lvl}
selected = prompt.select("Here are some card stats you can pick.",choices)

puts "Name☟"
p selected.name
puts "Type☟"
p selected.kind
puts "Race☟"
p selected.race
puts "Description☟"
p selected.desc
puts "Attack☟"
p selected.attack
puts "Defense☟"
p selected.defense
puts "Level☟"
p selected.level

prompt = TTY::Prompt.new
# binding.pry

"0"
