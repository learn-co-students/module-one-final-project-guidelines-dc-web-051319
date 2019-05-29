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
  puts "Time to build your deck:"
  puts "How would you like to add cards to your deck at random or by choice?"
  reply = gets.chomp
  if (reply !='yes' || reply != 'no' )
      puts ' Please answer "yes" or "no".'
    

  elsif reply == 'yes'
      reply = true
  else reply == 'no'
      reply = false
  end
  # if reply == true
  #   x = Card.all.sample(40)
  #   x.each do |card|
  #     card.deck = deck1
  #   else puts "Okay you can select your deck by choice"
end

def deck_builder
  
end


# def get_monster_card_from_user
#   puts "How many monster cards would you like to draw."
#   input = gets.chomp.to_i
#   monster_cards.sample(input)
# end
