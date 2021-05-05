$LOAD_PATH << '.'
require "board"
require "player"
class Game
    def initialize
        @game_board = Board.new
        @white_player = Player.new("W")
        @black_player = Player.new("B")
        @quit_player = nil
    end
    
    def play
        while true
            break if give_turn(@white_player) == "quit"
            break if give_turn(@black_player) == "quit"
        end
        puts "#{@quit_player} quit the game..." if @quit_player != nil
    end

    def give_turn(player)
        loop do
            puts "#{player.get_player_type} Player's turn.."
            puts "Press 1: Display all your available pieces (non-captured)"
            puts "Press 2: Display all your and opponent's available pieces (non-captured)"
            puts "Press 3: Display your captured pieces"
            puts "Press 4: Display available moves of a piece"
            puts "Press 5: Take your turn"
            puts "Press 6: Quit the Game"
            choice = gets.chomp.to_i
            turn_success = false
            case choice
            when 1
               player.display_my_available_pieces(@game_board)
               print "\n"
            when 2
               player.display_all_pieces(@game_board)
               print "\n"
            when 3
               player.display_captured_pieces
               print "\n"
            when 4
                print "Enter piece name(case sensitive i.e Pawn):"
                piece_name = gets.chomp
                print "Enter position of piece(i.e 1,2):"
                position = gets.chomp
                available_moves = player.get_available_moves(@game_board, piece_name, position)
                print "\n"
                puts "No valid moves are available!" if available_moves.empty?
                print "Valid available moves are: ", available_moves, "\n" if !available_moves.empty? && available_moves != "You entered wrong current position or wrong piece name!"
                print "\n"
            when 5
                print "Enter piece name(case sensitive i.e Pawn):"
                piece_name = gets.chomp
                print "Enter current position of piece(i.e 1,2):"
                curr_position = gets.chomp
                print "Enter new position of piece(i.e 1,2):"
                new_position = gets.chomp
                move_result = player.move(@game_board, piece_name, curr_position, new_position)
                if move_result != nil && move_result != 1 && move_result != 2 && move_result != 3
                    puts "Turn successfully executed."
                    if player.get_player_type == "White"
                        @black_player.add_captured_piece(move_result)
                        puts "Piece of #{@black_player.get_player_name} #{move_result} CAPTURED!!!"
                    else
                        @white_player.add_captured_piece(move_result)
                        puts "Piece of #{@white_player.get_player_name} #{move_result} CAPTURED!!!"
                    end
                    turn_success = !turn_success
                elsif move_result == nil
                    turn_success = !turn_success
                    puts "Turn successfully executed."
                end
                print "\n"
            when 6
                @quit_player = player.get_player_name
               return "quit"
            else
               puts "Invalid Option"
            end

            if turn_success == true
                break
            end
        end
    end
    private :give_turn

end