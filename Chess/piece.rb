#require_relative "board.rb"
class Piece
    attr_accessor :pos, :color
    def initialize (color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

end












