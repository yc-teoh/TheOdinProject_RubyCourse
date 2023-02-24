module TicTacToe
    class Game
        box = {}
        attr_accessor :box
    
        lines = []
        attr_reader :lines
    
        status = ""
        attr_accessor :status
        
        def initialize(p1, p2)
            @p1 = p1
            @p2 = p2

            @box = {
                "A1" => " ", "A2" => " ", "A3" => " ",
                "B1" => " ", "B2" => " ", "B3" => " ",
                "C1" => " ", "C2" => " ", "C3" => " "
            }

            @lines = [
                ["A1", "A2", "A3"], ["B1", "B2", "B3"], ["C1", "C2", "C3"],
                ["A1", "B1", "C1"], ["A2", "B2", "C2"], ["A3", "B3", "C3"],
                ["A1", "B2", "C3"], ["A3", "B2", "C1"]
            ]

            @status = "ONGOING"
        end

        # check whether the input is within the valid range
        def check_valid_tile(choice)
            is_valid_tile = false

            box.each do |key, value|
                if key == choice
                    is_valid_tile = true
                    puts "VALID TILE"
                else
                    is_valid_tile = false
                    puts "INVALID TILE"
                end
            end

            return is_valid_tile
        end

        # check whether the input is already present in the box
        def check_occupied_tile(choice)
            is_valid_tile = false

            box.each do |key, value|
                if key == choice
                    if value == " "
                        puts "VACANT TILE"
                    else
                        puts "OCCUPIED TILE" 
                    end
                end
            end

            return is_valid_tile
        end
    end

    # ------------------

    class Player
        tile = []
        p_status = ""

        def initialize(name)
            @name = name
            @tile = []
            @p_status = ""
        end

        attr_accessor :name, :tile, :p_status
    end

    # ------------------

    class TileBoard
        tiles = []
        attr_accessor :tiles

        def initialize
        end

        def populate_board(current_box)
            tiles = []
            current_box.each do |key, value|
                tiles.append(value)
            end

            p "+---+---+---+"
            p "+ #{tiles[0]} + #{tiles[1]} + #{tiles[2]} +"
            p "+---+---+---+"
            p "+ #{tiles[3]} + #{tiles[4]} + #{tiles[5]} +"
            p "+---+---+---+"
            p "+ #{tiles[6]} + #{tiles[7]} + #{tiles[8]} +"
            p "+---+---+---+"
        end

        def method_missing(method, *args)
            p "SORRY. #{method} UNKNOWN."
        end
    end
end

# avoid `Uninitialized constant error`
include TicTacToe

p1 = Player.new("James")
p2 = Player.new("Madeline")
g = Game.new(p1, p2)
tb = TileBoard.new
p1.p_status = "TURN"

puts "\nHello #{p1.name} and #{p2.name}.\n\n"

count = 0

while g.status != "END" do
    # p g.box
    tb.populate_board(g.box)

    if p1.p_status == "TURN"
        p "[P1] Please enter your choice of tile:"
        choice = gets.chomp
        # p "#{choice} selected!\n"
        g.check_valid_tile(choice)
        g.check_valid_tile(choice)
        p1.tile.append(choice)
        g.box[choice] = "O"

        # p p1.tile

        p1.p_status = ""
        p2.p_status = "TURN"

    elsif p2.p_status == "TURN"
        p "[P2] Please enter your choice of tile:"
        choice = gets.chomp
        # p "#{choice} selected!"
        g.check_valid_tile(choice)
        g.check_valid_tile(choice)
        p2.tile.append(choice)
        g.box[choice] = "X"

        # p p2.tile

        p2.p_status = ""
        p1.p_status = "TURN"

    else
        p "FATAL ERROR."

    end

    count += 1
    p "count = #{count}"
    puts "\n"

    if count == 6
        g.status = "END"
    end
end

if g.status == "END"
    p p1.tile
    p p2.tile
end