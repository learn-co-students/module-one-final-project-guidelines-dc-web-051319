require 'rest-client'
require 'json'
require 'pry'
all_cards = nil

def all_cards
  response_string = RestClient.get('https://db.ygoprodeck.com/api/v4/cardinfo.php')
  response_hash = JSON.parse(response_string)
end


def get_monster_cards_from_api
  monster_cards = all_cards[0].select do |hash|
    hash["type"] == "Normal Monster"
    end
  puts "How Many Monster Cards Would You Like to draw"
  x = gets.chomp.to_i
  monster_cards.sample(x)
end

def get_trap_cards_from_api
  trap_cards = all_cards[0].select do |hash|
    hash["type"] == "Trap Card"
>>>>>>> cd3faea9d502e21f34957e654b691383a23e426a
    end
  puts "How Many Trap Cards Would You Like to draw"
  x = gets.chomp.to_i
  trap_cards.sample(x)
end

def get_specific_card
  puts "What specific card would you like(case sensitive)"
  card_name = gets.chomp
selected_card =  all_cards[0].find do |hash|
    if hash["name"] == card_name
      return hash
    end
end
end


binding.pry


    0
