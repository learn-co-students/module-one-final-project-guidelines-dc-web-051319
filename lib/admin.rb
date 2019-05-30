require_relative '../config/environment.rb'

class Admin

    def self.clear_db
        Board.destroy_all
        Restaurant.destroy_all
        Square.destroy_all
        User.destroy_all
        Visit.destroy_all
    end

    def self.get_data(offset=0, term="restaurants", loc="Washington, DC")
        yelp = YelpAPI.new
        data = yelp.search(term, loc, offset)
        data["businesses"]
    end

    def self.get_restaurants
        restaurants = get_data 
        restaurants.concat(get_data(51))
        restaurants.concat(get_data(101))
        restaurants.concat(get_data(151))
        restaurants.concat(get_data(201))
        restaurants.concat(get_data(251))
        restaurants.each do |r|
            Restaurant.create(yelp_id: r["id"], name: r["name"])
        end
    end

    def self.make_board
        puts ""
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
            puts "Done."
            sleep(1.5)
        when 'r'
            self.get_restaurants
            puts "Done."
            sleep(1.5)
        when 'b'
            self.make_board
            puts "Done."
            sleep(1.5)
        when 'u'
            self.make_users
            puts "Done."
            sleep(1.5)
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
