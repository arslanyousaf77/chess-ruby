class Player
    def initialize(type, name = "")
        if type == "W" || type == "w"
            @player_type = "White"
            name = "White Player" if name == ""
            @player_name = name
        else
            @player_type = "Black"
            name = "Black Player" if name == ""
            @player_name = name
        end
        puts @player_type
        puts @player_name
    end
    def get_my_available_pieces(board)
        
    end
    
end

Player.new("w", "Arslan")