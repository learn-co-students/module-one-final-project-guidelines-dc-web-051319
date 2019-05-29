class Board < ActiveRecord::Base
    has_many :squares

    def fill_board
        ids = Restaurant.ids.sample(24)
        for i in 0..4 do
            for j in 0..4 do
                if i == 2 && j == 2
                    "free"
                else
                    id = ids.pop
                    Square.new(restaurant_id: id, board_id: self.id, row: i, column: j).save
                end
            end
        end
    end


    def print_board(user)
        ref = <<-END
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

    

        board = [  ["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   ", "\u2B50  ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "]  ]

        # y = "\u2B50"
     
        # puts y.encode('utf-8')
       

        visits = user.visits
        restaurant_ids = visits.map{ |visit| visit.restaurant_id } 
        marked_squares = restaurant_ids.map{ |id| Square.find_by(restaurant_id: id) }

        p marked_squares

        # cross = "\u274C"
        # puts cross.encode('utf-8')
        
        marked_squares.each do |square|
            row = square.row 
            column = square.column
            board[row][column] = " \u274C "
        end

        
        
        div = "-\u2501-\u254B-\u2501-\u254B-\u2501-\u254B-\u2501-\u254B-\u2501-"
        
        puts board[0].join("\u2503")
        puts div
        puts board[1].join("\u2503")
        puts div
        puts board[2].join("\u2503")
        puts div
        puts board[3].join("\u2503")
        puts div
        puts board[4].join("\u2503")
    end

end

