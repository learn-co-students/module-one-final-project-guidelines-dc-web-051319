class Board < ActiveRecord::Base
    has_many :squares

    def fill_board
        ids = Restaurant.ids.sample(24)
        for i in 0..4 do
            for j in 0..4 do
                if i == 2 && j == 2
                    "free" #Square.new(restaurant_id: nil , board_id: self.id, row: i, column: j).save
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

        marked_squares = get_marked_squares(user)

        marked_squares.each do |square|
            row = square.row
            column = square.column
            board[row][column] = " \u274C "
        end

        div = "\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501\u254B\u2501-\u2501"

        puts board[0].join("\u2503")
        puts div
        puts board[1].join("\u2503")
        puts div
        puts board[2].join("\u2503")
        puts div
        puts board[3].join("\u2503")
        puts div
        puts board[4].join("\u2503")
        puts ""
    end

    def print_basic_board(user)
        system "clear" or system "cls"

        board = [["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   "," * ","   ","   "], ["   ","   ","   ","   ","   "], ["   ","   ","   ","   ","   "]]

        marked_squares = get_marked_squares(user)

        marked_squares.each do |square|
            row = square.row
            column = square.column
            board[row][column] = " X "
        end

        div = "---|---|---|---|---"

        puts board[0].join("|")
        puts div
        puts board[1].join("|")
        puts div
        puts board[2].join("|")
        puts div
        puts board[3].join("|")
        puts div
        puts board[4].join("|")
        puts ""
    end

    def get_marked_squares(user)
        visits = Visit.where("user_id = ?", user.id)
        restaurant_ids = visits.map{ |visit| visit.restaurant_id }
        restaurant_ids.map{ |id| Square.find_by(restaurant_id: id) }
    end

    def diag_bingo?(marked)
        n = 0
        m = 0

        marked.each do |square|
            case
            when square.row == square.column
                n += 1
            when square.row + square.column == 4
                m += 1
            end
        end

        n == 4 || m == 4
    end

    def cross_bingo?(marked)
        rows = []
        columns = []

        marked.each do |square|
            rows << square.row
            columns << square.column
        end

        c = 0
        for i in 0..4 do
            for j in 0..4 do
                case
                when rows.count(i) > c
                    c = rows.count(i)
                when columns.count(j) > c
                    c = columns.count(j)
                end
            end
        end
        uniq_rows = rows.uniq.length
        uniq_columns = columns.uniq.length

        c == 4 && (uniq_rows == 5 || uniq_columns == 5)
    end


    def bingo?(user)

        marked = get_marked_squares(user)

        bingo = diag_bingo?(marked) || cross_bingo?(marked)

        if bingo
            puts "BINGO!!!"
        else
            puts "So close... Maybe next time!?"
        end
    end

end
