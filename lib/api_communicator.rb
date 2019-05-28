require 'rest-client'
require 'json'
require 'pry'

def get_monster_cards_from_api(x)
    response_string = RestClient.get('https://db.ygoprodeck.com/api/v4/cardinfo.php')
    response_hash = JSON.parse(response_string)
    
    new_array = []
    cards = response_hash[0].select do |hash|
        hash["type"] == "Normal Monster"
        response_string = RestClient.get(hash)
        hash_info = JSON.parse(response_string)
        new_array << hash_info
    end
    new_array
        
    end
    binding.pry
    0
end