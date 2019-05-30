require_relative '../config/environment'

Login.welcome
user = nil

until user.is_a?(User)
    user = Login.get_user
end

basic = Login.config_board

board = Login.select_board

quit = false

until quit
    options = Play.print_restaurant_list
    restaurant = Play.go_to_restaurant?(options)
    user.have_meal(restaurant)

    basic ? board.print_basic_board(user) : board.print_board(user)

    board.bingo?(user)

    quit = Login.exit
end
