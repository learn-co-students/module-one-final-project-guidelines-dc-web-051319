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

        system "clear" or system "cls"

        board = [  ["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   ", "\u2B50  ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "]  ]

        # y = "\u2B50"

        # puts y.encode('utf-8')


        marked_squares = get_marked_squares(user)

        # cross = "\u274C"
        # puts cross.encode('utf-8')

        marked_squares.each do |square|
            row = square.row
            column = square.column
            board[row][column] = " \u274C "
        end


        border = "---------------------"
        
        div = "\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501"

        puts border
        puts board[0].join("\u2503")
        puts div
        puts board[1].join("\u2503")
        puts div
        puts board[2].join("\u2503")
        puts div
        puts board[3].join("\u2503")
        puts div
        puts board[4].join("\u2503")
        puts border
    end

    def get_marked_squares(user)
        visits = Visit.where("user_id = ?", user.id)
        restaurant_ids = visits.map{ |visit| visit.restaurant_id }
        marked_squares = restaurant_ids.map{ |id| Square.find_by(restaurant_id: id) }
        return marked_squares
    end


    def bingo?(user)
        rows = [2]
        columns = [2]

        marked = get_marked_squares(user)

        marked.each do |square|
            rows << square.row
            columns << square.column
        end

        uniq_rows = rows.uniq.length
        uniq_columns = columns.uniq.length

        # Diagonal Bingo
        c = 0
        marked.each do |square|
            if square.row == square.column
            c += 1
            end
        end 

        return true if c == 4 
        # return true if uniq_rows == 5 && uniq_columns == 5

        c = 0 
        marked.each do |square|
            if square.row + square.column == 4
            c += 1
            end 
        end 

        return true if c == 4  

        # Horizontal Bingo
        row_mode = rows.max_by{ |i| rows.count(i) }
        return true if uniq_columns == 5 && rows.count(row_mode) == 5

        # # Vertical Bingo
        column_mode = columns.max_by{ |j| columns.count(j) }
        return true if uniq_rows == 5 && columns.count(column_mode) == 5

        # No Bingo
        return false
    end


end
