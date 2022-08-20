require_relative 'consts.rb'
class Apple
    def initialize
        @location = [rand(SCREEN_WIDTH), rand(SCREEN_HEIGHT)]
    end
    def draw
        Square.new(
            x: @location[0] * GRID_SIZE, y: @location[1] * GRID_SIZE,
            size: GRID_SIZE - 1,
            color: 'yellow',
            z: 10
          ) 
    end
    def ==(other)
        @location == other.location
    end
end