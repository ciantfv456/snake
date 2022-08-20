require 'ruby2d'
class Board
    def initialize
        @points = 0
    end
    def point
        @points += 1
    end
    def draw
        Text.new(
            "Points: #{@points}",
            x: 20, y: 20,
            style: 'bold',
            size: 20,
            color: 'green',
            z: 11
          )
    end
end