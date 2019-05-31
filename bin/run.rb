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
    restaurant = board.print_restaurant_list(user)

    restaurant.get_info

    if restaurant.confirm

        user.have_meal(restaurant)

        basic ? board.print_basic_board(user) : board.print_board(user)

        board.bingo?(user)

        quit = Login.exit
        
    end
end
