require_relative '../config/environment.rb'

Card.destroy_all
Deck.destroy_all
Player.destroy_all
DeckCard.destroy_all


response_string = RestClient.get('https://db.ygoprodeck.com/api/v4/cardinfo.php')
response_hash = JSON.parse(response_string)

monster_card = response_hash[0].select do |card|
    card["type"] == "Normal Monster"
end

monster_card.each do |card|
    Card.create(name: card["name"], kind: card["type"], desc: card["desc"], defense: card["def"], attack: card["atk"], level: card["level"], race: card["race"])
end

trap_card = response_hash[0].select do |card|
    card["type"] == "Trap Card"
end
GU
trap_card.each do |card|
    Card.create(name: card["name"], kind: card["type"], desc: card["desc"], defense: card["def"], attack: card["atk"], level: card["level"], race: card["race"])
end

spell_card = response_hash[0].select do |card|
    card["type"] == "Spell Card"
end

spell_card.each do |card|
    Card.create(name: card["name"], kind: card["type"], desc: card["desc"], defense: card["def"], attack: card["atk"], level: card["level"], race: card["race"])
end

binding.pry
