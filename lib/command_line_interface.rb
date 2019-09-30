require_relative '../config/environment'

def welcome
  puts "⚜️ ⚜️ ⚜️  𝙒 𝙀 𝙇 𝘾 𝙊 𝙈 𝙀   𝙏 𝙊   𝙔 𝙂 𝙊 𝘿 𝙀 𝘾 𝙆 𝘽 𝙐 𝙄 𝙇 𝘿 𝙀 𝙍  ⚜️ ⚜️ ⚜️"
  puts "Please enter your name ✎"
  gets.chomp
end


def make_player(name)
  Player.create(name: name)
end


def name_deck
  puts "What would you like to name your Deck? ✎"
  gets.chomp
end


def make_deck(name, id)
  Deck.create(name: name, player_id: id)
end


def make_carddeck(player)
  empty_deck =  player.decks.first.cards
    x = Card.all.sample(40)
    x.each do |card|
      empty_deck << card
  end
end


def time_to_build
  puts "➨ The cards in your deck will be gifted to you at random,\nlater you'll be given the opportunity to add/remove cards from your deck!\n\n 💎hit return to continue💎"
  gets.chomp
end


def here_deck(player)
  here = player.decks.first.cards
  here.each_with_index {|cards, i| puts "#{i+1}: #{cards.name}"}
end


def add_card_prompt
  puts  "⌛Time to add a card. Choose a card to put into your deck:"
  gets.chomp
end


def add_single_card(card_name, player)
  here = player.decks.first.cards
  card = Card.find_by(name: card_name)
  if card
    here << card
    puts "➠ You have added #{card.name} to your deck"
  else 
    puts "➟ Card doesn't exist."
  end
end


def remove_card_prompt
  puts  "⌛Time to remove a card. Choose a card to remove from your deck:"
  gets.chomp
end


def remove_card(card_name, player)
  here = player.decks.first.cards
   card = here.find_by(name: card_name)
   if card
     here.delete(card)
     puts "➠ You have removed #{card.name} from your deck"
   else 
    puts "➟ Either you don't want to remove a card or it doesn't exist in your deck"
   end
end


def find_highest_attack(player)
  # puts "Here is the card with the highest ATTACK"
  here = player.decks.first.cards
  not_nil = here.select do |obj|
    obj.attack != nil
  end
  as = not_nil.max_by { |obj| obj.attack }
end


def find_highest_defense(player)
  # puts "Here is the card with the highest DEFENSE"
  here = player.decks.first.cards
  not_nil = here.select do |obj|
    obj.defense != nil
  end
  as = not_nil.max_by { |obj| obj.defense }
end


def find_highest_level(player)
  # puts "Here is the card with the highest LEVEL"
  here = player.decks.first.cards
  not_nil = here.select do |obj|
    obj.level != nil
  end
  as = not_nil.max_by { |obj| obj.level }
end


