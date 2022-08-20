require 'ruby2d'
require_relative 'consts.rb'
class Snake
    attr_reader :looks
    attr_writer :looks
    attr_writer :grow
    attr_reader :dead
    attr_writer :dead
    attr_reader :body
    def initialize
        @body = [[SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2]]
        @directions = {'left' => [-1, 0], 'right' => [1, 0], 'up' => [0, -1], 'down' => [0, 1]}
        @looks = 'down'
        @grow = false
        @dead = false
    end
    def location
        @body.last
    end
    def draw
        for direction in @body do
            Square.new(
                x: direction[0] * GRID_SIZE, y: direction[1] * GRID_SIZE,
                size: GRID_SIZE - 1,
                color: 'white',
                z: 10
              )    
        end 
    end
    def move
        if !@dead
            @body.push([(@body.last[0] + @directions[@looks][0]) % SCREEN_WIDTH, (@body.last[1] + @directions[@looks][1]) % SCREEN_HEIGHT])
            if !@grow
                @body.shift
            end
            @grow = false
        end
    end
    def check_death?
        @body.uniq.length != @body.length
    end
end