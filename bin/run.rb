require_relative '../config/environment'

def get_data(term="dinner", loc="Washington, DC")
    yelp = YelpAPI.new
    data = yelp.search(term, loc)
    data["businesses"]
end

def get_names
    get_data.map{ |restaurant| restaurant["name"] }
end

puts get_names
