# Board Class for Memory Game
require_relative "./card_class.rb"


class Board 

    NUMBERS = (1..8).to_a

    def initialize 
        @grid = Array.new(4) { Array.new (4) }
    end 

    def populate 
        pairs = []
        counter = 0 
        NUMBERS.each do |number|
            pairs << Card.new(number)
            pairs << Card.new(number)
        end 

        pairs.shuffle!

        @grid.each_index do |row|
            @grid.each_index do |col|
                @grid[row][col] = pairs[counter]
                counter += 1 
            end 
        end 
    end 

    def render
        
        puts "  " + [0,1,2,3].join(" ")
        @grid.each_with_index do |row, idx| 
            current_row = []
            row.each do |card|
               current_row << card.display
            end 
            puts idx.to_s + " " + current_row.join(" ")
        end 
    
    end

    def won?
        if @grid.flatten.all? { |card| card.has_been_revealed? }
            return true
        else 
            return false
        end 

    end 

    def reveal(guessed_pos)
        self[guessed_pos].reveal
        self[guessed_pos].value
    end 

    def [](guessed_pos)
        row, col = guessed_pos
        @grid[row][col]
    end 
        
end 


# board = Board.new
# board.populate
# board.render
# board.reveal([2,3])

