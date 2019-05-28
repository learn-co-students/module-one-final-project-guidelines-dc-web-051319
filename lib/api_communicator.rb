require 'rest-client'
require 'json'
require 'pry'

def get_monster_cards_from_api
    response_string = RestClient.get('https://db.ygoprodeck.com/api/v4/cardinfo.php')
    response_hash = JSON.parse(response_string)
    
    monster_cards = response_hash[0].select do |hash|
        hash["type"] == "Normal Monster"
    end
    binding.pry
    0
end