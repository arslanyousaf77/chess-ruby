$LOAD_PATH << '.'
require "board"
class Player
    @@w_first_move = false
    @@b_first_move = false
    
    def initialize(type="", name = "")
        if type == "W" || type == "w"
            @player_type = "White"
            name = "White Player" if name == ""
            @player_name = name
        elsif type == "B" || type == "b"
            @player_type = "Black"
            name = "Black Player" if name == ""
            @player_name = name
        else
            raise "You must have to specify player type/color (w or b) as first argument"
        end
    end

    def display_my_available_pieces(board)
       puts board.get_available_pieces(@player_type)
    end

    def display_all_pieces(board)
       all_pieces = board.get_all_pieces(@player_type)
       puts "Your Available Pieces and Positions:"
       puts all_pieces[:my_available_pieces]

       puts "\nOpponent Available Pieces and Positions:"
       puts all_pieces[:opponent_available_pieces]
    end

    def display_available_moves(board, piece, position)
       if board.validate_piece_position(piece, position, @player_type)
        puts true
       else
        puts "You entered wrong current position or wrong piece name!"
       end
    end
end

Player.new("w", "Arslan").display_available_moves(Board.new, "Pawn", "9,6")