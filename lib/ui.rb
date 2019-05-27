require 'curses'

# Setup magic numbers
SCREEN_HEIGHT      = 24
SCREEN_WIDTH       = 100
HEADER_HEIGHT      = 1
HEADER_WIDTH       = SCREEN_WIDTH
MAIN_WINDOW_HEIGHT = SCREEN_HEIGHT - HEADER_HEIGHT
MAIN_WINDOW_WIDTH  = SCREEN_WIDTH

def test_ui
    Curses.noecho
    Curses.nonl
    Curses.stdscr.keypad(true)
    Curses.raw
    Curses.stdscr.nodelay = 1

    Curses.init_screen

    Curses.start_color

    Curses.init_pair(2, Curses::COLOR_BLACK, Curses::COLOR_BLUE)
    Curses.init_pair(3, Curses::COLOR_BLACK, Curses::COLOR_WHITE)

    main_window = Curses::Window.new(0,0,1,0)

    main_window.setpos(1, 0)
    main_window << print_board

    main_window.refresh

    # Setup header
    header_window = Curses::Window.new(HEADER_HEIGHT, HEADER_WIDTH, 0, 0)
    header_window.color_set(2)
    header_window << "Restaurant Bingo".center(HEADER_WIDTH)
    header_window.refresh

    main_window.setpos(14, 0)
    main_window << "Press a key to get the ordinal value. Press 'q' to quit."

    until (input = main_window.getch) == 'q'

        main_window.setpos(15, 0)
    
        main_window << "You pressed: #{input}."

        unless input.is_a?(Integer)
            main_window << " That character has an ordinal value of: #{input.ord}"
        end

        main_window.refresh
    end
end
