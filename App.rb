require 'ruby2d'
require_relative 'Snake.rb'
require_relative 'Apple.rb'
require_relative 'Board.rb'
require_relative 'consts.rb'
set color: 'navy'
set fps_cap: 18
snake = Snake.new
apple = Apple.new
board = Board.new
tick = true
on :key_down do |event|
    # A key was pressed
    if DIRECTIONS.include? event.key and (event.key != DIRECTIONS[(DIRECTIONS.find_index(snake.looks) + 2) % 4] or snake.body.length == 1) and !tick
        snake.looks = event.key
        tick = true
    end
end
update do
    tick = false
    clear
    snake.move
    if apple == snake
        apple = Apple.new
        snake.grow = true
        board.point
    end
    if snake.check_death?
        snake.dead = true
    else
        apple.draw
    end
    snake.draw
    board.draw
end
show