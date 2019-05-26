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
    div0 = "----|----|----|----|----"
    row1 = " 01 | 02 | 03 | 04 | 05 "
    row2 = " 06 | 07 | 08 | 09 | 10 "
    row3 = " 11 | 12 | fr | 14 | 15 "
    row4 = " 16 | 17 | 18 | 19 | 20 "
    row5 = " 21 | 22 | 23 | 24 | 25 "
    puts
    puts row1
    puts div0
    puts row2
    puts div0
    puts row3
    puts div0
    puts row4
    puts div0
    puts row5
    puts
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

print_board
