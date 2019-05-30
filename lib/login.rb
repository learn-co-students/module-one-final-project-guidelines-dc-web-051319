require_relative '../config/environment.rb'
require_relative '../app/models/user.rb'
require_relative '../app/models/visit.rb'
require_relative '../app/models/restaurant.rb'
require_relative '../app/models/square.rb'
require_relative '../app/models/board.rb'

class Login

    def self.welcome
        system "clear" or system "cls"
        puts "Welcome to Restaurant Bingo!"
    end

    def self.get_user
        print "Please enter your name:  "
        name = gets.chomp
        user = User.all.find{ |user| user.name.downcase == name.downcase }
        unless user.nil?
            user
        else
            self.new_user(name)
        end
    end

    def self.new_user(name)
        puts "It appears that you haven't played before."
        puts "Would you like to register as a new user?"
        print "(Y)es/(N)o: "
        ans = gets.chomp.downcase
        if ans == 'y'
            User.new(name: name).save
        else
            return nil
        end
    end

    def self.config_board
        print "Press ENTER for a regular or 'b' for a (b)asic board:"
        ans = gets.chomp.downcase
        ans == 'b' ? true : false
    end

    def self.exit
        puts "Press ENTER to continue or 'q' to quit."
        print "(Q)uit?: "
        ans = gets.chomp.downcase
        ans == 'q' ? true : false
    end
end
