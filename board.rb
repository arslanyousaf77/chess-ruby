class Board
    def initialize
        rows, cols, default_value = 8, 8, "-"
        @game_board = Array.new(rows){Array.new(cols,default_value)}

        populate
    end

    def populate
        @game_board.each_with_index do | row, index |
            if index == 1
                row.map! {|element| element = "W Pawn"}
            elsif index == 6
                row.map! {|element| element = "B Pawn"} 
            end
        end

        @game_board[0][0] = "W Rook"
        @game_board[0][1] = "W Knight"
        @game_board[0][2] = "W Bishop"
        @game_board[0][3] = "W Queen"
        @game_board[0][4] = "W King"
        @game_board[0][5] = "W Bishop"
        @game_board[0][6] = "W Knight"
        @game_board[0][7] = "W Rook"
        
        @game_board[7][0] = "B Rook"
        @game_board[7][1] = "B Knight"
        @game_board[7][2] = "B Bishop"
        @game_board[7][3] = "B Queen"
        @game_board[7][4] = "B King"
        @game_board[7][5] = "B Bishop"
        @game_board[7][6] = "B Knight"
        @game_board[7][7] = "B Rook"
    end
    private :populate

    def display_board
        @game_board.each do | row|
            row.each do |element|
                print element, " "
            end
            puts
        end
    end

end

Board.new.display_board