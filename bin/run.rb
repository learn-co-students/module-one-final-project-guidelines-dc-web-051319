require_relative '../config/environment'

Login.welcome
user = nil

until user.is_a?(User)
    user = Login.get_user
end

basic = Login.config_board

quit = false

until quit
    options = Play.print_restaurant_list
    restaurant = Play.go_to_restaurant?(options)
    user.have_meal(restaurant)

    basic ? Board.first.print_basic_board(user) : Board.first.print_board(user)

    puts Board.first.bingo?(user)

    quit = Login.exit
end
