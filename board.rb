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

    def get_available_pieces(player_type)
        available_pieces = Array.new
        type = "B"
        type = "W" if player_type == "White"
        @game_board.each_with_index do | row, row_index |
            row.each_with_index do | element, col_index |
                if element[0] == type
                    piece = {}
                    piece[:name] = element.delete(type+" ")
                    piece[:position] = row_index.to_s + ","+col_index.to_s
                    available_pieces.push(piece)
                end
            end
        end
        available_pieces
    end

    def get_all_pieces(player_type)
        my_available_pieces = Array.new
        opponent_available_pieces = Array.new

        my_type = "B"
        my_type = "W" if player_type == "White"
        opponent_type = "B"
        opponent_type = "W" if my_type == "B"
        
        @game_board.each_with_index do | row, row_index |
            row.each_with_index do | element, col_index |
                if element[0] == my_type
                    piece = {}
                    piece[:name] = element.delete(my_type+" ")
                    piece[:position] = row_index.to_s + ","+col_index.to_s
                    my_available_pieces.push(piece)
                elsif element[0] == opponent_type
                    piece = {}
                    piece[:name] = element.delete(opponent_type+" ")
                    piece[:position] = row_index.to_s + ","+col_index.to_s
                    opponent_available_pieces.push(piece)
                end
            end
        end
        {my_available_pieces: my_available_pieces, opponent_available_pieces: opponent_available_pieces}
    end

    def display_board
        @game_board.each do | row|
            row.each do |element|
                print element, " "
            end
            puts
        end
    end

    def validate_piece_position(piece, position, player_type)
        positionArr = position.split(',')
        row = positionArr[0].to_i
        col = positionArr[1].to_i

        if col > 7 || col < 0 || row > 7 || row < 0
            return false
        end
        type = "B "
        type = "W " if player_type == "White"
        piece_name = type + piece

        if piece_name == @game_board[row][col]
            true
        else
            false
        end
    end

end

Board.new.get_available_pieces("Black")