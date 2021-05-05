$LOAD_PATH << '.'
require "piece"
class Pawn < Piece
    
    def get_available_moves(player, board, piece, position)
        available_moves = Array.new
        positionArr = position.split(',')
        row = positionArr[0].to_i
        col = positionArr[1].to_i
        
        if player.get_player_type == "White"
            if row == 1
                if board.get_piece_at_position("#{row+1},#{col}") == "-"
                    available_moves.push("(#{row+1},#{col})")
                end
                if board.get_piece_at_position("#{row+2},#{col}") == "-"
                    available_moves.push("(#{row+2},#{col})")
                end
            elsif row < 7
                if board.get_piece_at_position("#{row+1},#{col}") == "-"
                    available_moves.push("(#{row+1},#{col})")
                end
            end
            if row < 7 
                if col == 0 
                    if board.get_piece_at_position("#{row+1},#{col+1}")[0]== "B"
                        available_moves.push("(#{row+1},#{col+1})")
                    end
                elsif col == 7 
                    if board.get_piece_at_position("#{row+1},#{col-1}")[0] == "B"
                        available_moves.push("(#{row+1},#{col-1})")   
                    end
                else
                    if board.get_piece_at_position("#{row+1},#{col+1}")[0] == "B"
                        available_moves.push("(#{row+1},#{col+1})")
                    end
                    if board.get_piece_at_position("#{row+1},#{col-1}")[0] == "B"
                        available_moves.push("(#{row+1},#{col-1})")
                    end
                end
            end
        elsif player.get_player_type == "Black"
            if row == 6
                if board.get_piece_at_position("#{row-1},#{col}") == "-"
                    available_moves.push("(#{row-1},#{col})")
                end
                if board.get_piece_at_position("#{row-2},#{col}") == "-"
                    available_moves.push("(#{row-2},#{col})")
                end
            elsif row > 0
                if board.get_piece_at_position("#{row-1},#{col}") == "-"
                    available_moves.push("(#{row-1},#{col})")
                end
            end
            if row > 0 
                if col == 0 
                    if board.get_piece_at_position("#{row-1},#{col+1}")[0]== "W"
                        available_moves.push("(#{row+1},#{col+1})")
                    end
                elsif col == 7
                    if board.get_piece_at_position("#{row-1},#{col-1}")[0]== "W"
                        available_moves.push("(#{row+1},#{col-1})")   
                    end
                else
                    if board.get_piece_at_position("#{row-1},#{col+1}")[0]== "W"
                        available_moves.push("(#{row-1},#{col+1})")
                    end
                    if board.get_piece_at_position("#{row-1},#{col-1}")[0]== "W"
                        available_moves.push("(#{row-1},#{col-1})")
                    end
                end
            end
        end
        available_moves
    end


end