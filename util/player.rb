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

        @captured_pieces = Array.new
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

    def get_available_moves(board, piece, position)
       if board.validate_piece_position(piece, position, @player_type)
        @pieces[piece].get_available_moves(self,board,piece,position)
       else
        "You entered wrong current position or wrong piece name!"
       end
    end

    def move(board, piece, current_position, new_position)
        new_pos = new_position
        new_position = "("+new_position+")"
        valid_moves = get_available_moves(board, piece, current_position)
        if valid_moves != "You entered wrong current position or wrong piece name!"
            if valid_moves.include?(new_position)
                board.update_game_board(current_position, new_pos)
            else
                puts "Oops, New position is not a valid move!"
                return 1
            end
        elsif valid_moves == "You entered wrong current position or wrong piece name!"
            puts "Oops, You entered wrong current position or wrong piece name!"
            return 2
        elsif valid_moves.empty?
            puts "Oops, No valid moves are available for this piece!"
            return 3
        end
    end

    def get_player_name
        @player_name
    end

    def get_player_type
        @player_type
    end

    def add_captured_piece(captured)
        @captured_pieces.push(captured)
    end

    def display_captured_pieces
        puts @captured_pieces if !@captured_pieces.empty?
        puts "No Captured Piece yet" if @captured_pieces.empty?
    end
end
