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

def build_empty_board
    div0 = "---|---|---|---|---"
    row1 = "   |   |   |   |   "
    row2 = "   |   |   |   |   "
    row3 = "   |   |   |   |   "
    row4 = "   |   |   |   |   "
    row5 = "   |   |   |   |   "
end

def assign_squares
    k = 0
    restaurants = get_id
    squares = [[], [], [], [], []]
    
    for i in 0..4 do
        for j in 0..4 do
            if i == 2 && j == 2
                squares[i][j] = "free"     
            else 
                squares[i][j] = restaurants[k]        
                k += 1  
            end
        end
    end

    squares
end

p assign_squares
