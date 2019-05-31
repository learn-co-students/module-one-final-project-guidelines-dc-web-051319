require_relative '../config/environment.rb'

class Login

    def self.welcome
        system "clear" or system "cls"
        puts "Welcome to Restaurant Bingo!"
    end

    def self.get_user
        print "Please enter your name: "
        name = gets.chomp

        if name.downcase == "admin"
            Admin.panel
        end

        user = User.all.find{ |user| user.name.downcase == name.downcase }
        unless user.nil?
            user
        else
            self.new_user(name)
        end
    end

    def self.new_user(name)
        system "clear" or system "cls"
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

    def self.select_board
        system "clear" or system "cls"
        list = Board.all.each_with_index do |board, i|
            puts "#{i+1}. #{board.date}"
        end

        if list.length < 1
            puts "No boards exist. Please contact your administrator."
            abort
        end

        puts ""
        puts "Please select a board."
        print "1-#{list.length}: "
        num = gets.chomp.to_i
        num = num.clamp(1, list.length)
        num -= 1
        list[num]
    end

    def self.config_board
        puts ""
        print "Press ENTER for a regular board or 'b' for a (b)asic board: "
        ans = gets.chomp.downcase
        ans == 'b' ? true : false
    end

    def self.exit
        puts ""
        print "Press ENTER to continue or 'q' to quit. "
        ans = gets.chomp.downcase
        ans == 'q' ? true : false
    end

end
