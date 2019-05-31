class Restaurant < ActiveRecord::Base
    has_many :visits
    has_many :squares

    def get_info
        yelp = YelpAPI.new
        hash = yelp.business(self.yelp_id)
        parse_info(hash)
    end

    def parse_info(hash)
        system "clear" or system "cls"
        if hash["hours"][0]["is_open_now"]
            puts "OPEN"
        else
            puts "CLOSED"
        end
        puts "Name: #{hash["name"]}"
        puts "Rating: #{hash["rating"]}"
        puts "Phone: #{hash["display_phone"]}"
        puts "Address: #{hash["location"]["display_address"].join(" ")}"
    end

    def confirm
        puts ""
        print "Ok? (y/n): "
        ans = ""
        until ans == "y" || ans =="n"
            ans = gets.chomp.downcase
        end
        if ans == 'y'
            return true
        else ans == 'n'
            return false
        end
    end
end
