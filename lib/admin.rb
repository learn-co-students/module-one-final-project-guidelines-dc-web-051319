require_relative '../config/environment.rb'

class Admin

    def self.clear_db
        Board.destroy_all
        Restaurant.destroy_all
        Square.destroy_all
        User.destroy_all
        Visit.destroy_all
    end

    def self.get_data(term="restaurants", loc="Washington, DC")
        yelp = YelpAPI.new
        data = yelp.search(term, loc)
        data["businesses"]
    end

    def self.get_restaurants
        get_data.each do |r|
            Restaurant.new(yelp_id: r["id"], name: r["name"]).save
        end
    end

    def self.make_board
        print "Please enter a date for your board: "
        date = gets.chomp
        board = Board.create(date: date)
        board.fill_board
    end

    def self.make_users
        User.create(name: "Matt")
        User.create(name: "Meghan")
    end

    def self.run(choice)
        case choice
        when 'c'
            self.clear_db
        when 'r'
            self.get_restaurants
        when 'b'
            self.make_board
        when 'u'
            self.make_users
        when 'p'
            binding.pry
        end
    end

    def self.panel
        ans = ""
        until ans == "q"
            system "clear" or system "cls"
            puts "What would you like to do?"
            puts "1. (C)lear database"
            puts "2. Get (r)estaurants from yelp"
            puts "3. Make a new (b)oard"
            puts "4. Make default (u)sers"
            puts "5. (P)ry"
            puts "6. (Q)uit"
            print "?: "
            ans = gets.chomp.downcase
            Admin.run(ans)
        end
        abort
    end

end
