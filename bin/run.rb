require_relative '../config/environment'

def get_data(term="restaurants", loc="Washington, DC")
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

def clear_db
    Board.destroy_all
    Restaurant.destroy_all
    Square.destroy_all
    User.destroy_all
    Visit.destroy_all
end

clear_db
make_users
make_restaurants
make_boards

matt = User.find_by_name("Matt")
matt.have_meal(Restaurant.find(Square.all.sample.restaurant_id))
matt.have_meal(Restaurant.find(Square.all.sample.restaurant_id))
Board.all.first.print_board(matt)


