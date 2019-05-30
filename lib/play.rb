require_relative '../config/environment.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/restaurant.rb'
require_relative '../app/models/square.rb'
require_relative '../app/models/board.rb'
require_relative '../app/models/visit.rb'

class Play

    def self.print_restaurant_list
        system "clear" or system "cls"
        board = Board.first
        squares = Square.where("board_id = ?", board)
        restaurants = squares.map do |square|
            Restaurant.find_by(id: square.restaurant_id)
        end
        i = 0
        sorted = restaurants.sort_by{ |restaurant| restaurant.name }
        sorted.each do |restaurant|
            i += 1
            puts "#{i}. #{restaurant.name}"
        end
        return sorted
    end

    def self.go_to_restaurant?(list)
        puts "Where would you like to go?"
        print "1-24: "
        num = gets.chomp.to_i
        num -= 1
        return list[num]
    end

end
