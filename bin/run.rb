require_relative '../config/environment'

def get_data(term="dinner", loc="Washington, DC")
    yelp = YelpAPI.new
    data = yelp.search(term, loc)
    data["businesses"]
end

def get_names
    get_data.map{ |restaurant| restaurant["name"] }
end

def get_id
    get_data.map{ |restaurant| restaurant["id"] }
end

def print_board
    board = <<-END 
    |----|----|----|----|----|
    | 01 | 02 | 03 | 04 | 05 |
    |----|----|----|----|----|
    | 06 | 07 | 08 | 09 | 10 |
    |----|----|----|----|----|
    | 11 | 12 | fr | 14 | 15 |
    |----|----|----|----|----|
    | 16 | 17 | 18 | 19 | 20 |
    |----|----|----|----|----|
    | 21 | 22 | 23 | 24 | 25 |
    |----|----|----|----|----|
    END
    board
end

def assign_squares
    n = 1
    k = 0
    restaurants = get_id
    squares = [[], [], [], [], []]
    
    for i in 0..4 do
        for j in 0..4 do
            if i == 2 && j == 2
                squares[i][j] = { index: "free", yelp_id: nil }     
            else 
                squares[i][j] = { index: n, yelp_id: restaurants[k]}         
                k += 1  
            end
            n += 1
        end
    end
    squares
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
end


make_users
make_boards
make_restaurants
matt = User.find_by_name("Matt")
restaurant = Restaurant.find(1)
matt.have_meal(restaurant)
puts Visit.all
binding.pry
