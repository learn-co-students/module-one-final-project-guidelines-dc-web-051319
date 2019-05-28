require_relative '../config/environment'

def get_data(term="dinner", loc="Washington, DC")
    yelp = YelpAPI.new
    data = yelp.search(term, loc)
    data["businesses"]
end

def make_users
    matt = User.new
    tim = User.new
    tif = User.new
    matt.name = "Matt"
    tim.name = "Tim"
    tif.name = "Tiffany"
    matt.save
    tim.save
    tif.save
end

def make_restaurants
    get_data.each do |r|
        Restaurant.new(yelp_id: r["id"], name: r["name"]).save
    end
end

def make_boards
    b1 = Board.new
    b1.date = "April 2017"
    b1.save
    b1.fill_board
end


make_users
make_boards
make_restaurants
matt = User.find_by_name("Matt")
restaurant = Restaurant.find(1)
matt.have_meal(restaurant)
puts Visit.all
puts Square.all
binding.pry
