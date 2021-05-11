require_relative 'piece.rb'
require 'byebug'
=begin
@rows: Array (of Arrays) - 8 x 8
--- methods
initialize
[] (pos)
[]= (pos,val)
move_piece (start_pos, end pos)    

=end

    

class Board
    attr_accessor :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)}
        self.place_pieces

    end

    def place_pieces
       #pos = []
        #white pawns
        (0..7).each do |colIx|
            @rows[1][colIx] = Pawn.new(:white, self, [1, colIx])
        end

        #white rook
        @rows[0][0] = Rook.new(:white, self, [0,0])
        @rows[0][7] = Rook.new(:white, self, [0,7])

        #white knight
        @rows[0][1] = Knight.new(:white, self, [0,1])
        @rows[0][6] = Knight.new(:white, self, [0,6])

        #white bishop
        @rows[0][2] = Bishop.new(:white, self, [0,2])
        @rows[0][5] = Bishop.new(:white, self, [0,5])

        #white queen
        @rows[0][3] = Queen.new(:white, self, [0,3])

        #white king
        @rows[0][4] = King.new(:white, self, [0,3])


        #black pawns
        (0..7).each do |colIx|
            pos = [6, colIx]
            @rows[6][colIx] = Pawn.new(:black, self, pos)
        end

        #black rook
        @rows[7][0] = Rook.new(:black, self, [7,0])
        @rows[7][7] = Rook.new(:black, self, [7,7])

        #black knight
        @rows[7][1] = Knight.new(:black, self, [7,1])
        @rows[7][6] = Knight.new(:black, self, [7,6])

        #black bishop
        @rows[7][2] = Bishop.new(:black, self, [7,2])
        @rows[7][5] = Bishop.new(:black, self, [7,5])

        #black queen
        @rows[7][3] = Queen.new(:black, self, [7,3])

        #black king
        @rows[7][4] = King.new(:black, self, [7,3])

        (3..5).each do |rowIx|
            (0..7).each do |colIx|
                @rows[rowIx][colIx] = NullPiece.new(nil, self, [rowIx, colIx])
            end
        end



    end

    def [](pos)
        x , y = pos[0], pos[1]
        @rows[x][y]
    end

    def []=(pos, val)
        x , y = pos[0], pos[1]
        @rows[x][y] = val
    end

    def move_pieces(color, start_pos, end_pos)
        startX, startY = start_pos[0], start_pos[1]
        finalX, finalY = end_pos[0], end_pos[1]
    
        if @row[startX][startY].is_a?(NullPiece)
            raise "No piece at start position"
        elsif @row[finalX][finalY].color == color
            raise "There is already a #{color} piece there"
        end
        
        

        @rows[finalX][finalY] = @rows[startX][startY]

       # elsif !piece.valid_moves.include(end_pos)
         #   raise "Not a valid move."
    end

end

# b = Board.new
# #b.place_pieces
# p b.rows