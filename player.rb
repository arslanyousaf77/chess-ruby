$LOAD_PATH << '.'
require "board"
require "piece"
require "pawn"
require "rook"
class Player

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

        @pieces = {"Pawn"=> Pawn.new, "Rook" => Rook.new}

        
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
        puts @pieces[piece].get_available_moves(self,board,piece,position)
       else
        puts "You entered wrong current position or wrong piece name!"
       end
    end

    def get_player_name
        @player_name
    end

    def get_player_type
        @player_type
    end

end

Player.new("w", "Arslan").display_available_moves(Board.new, "Pawn", "1,0")