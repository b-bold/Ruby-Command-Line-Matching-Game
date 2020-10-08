# Game Class for Memory Game

require_relative "./card_class.rb"
require_relative "./board_class.rb"
require_relative "./humanplayer.rb"
require_relative "./computerplayer.rb"
require "byebug"


class Memory_Game

    def initialize(board)
        @board = Board.new
        @previously_guessed = 0
        @humanplayer = Humanplayer.new
        @computerplayer = Computerplayer.new 
    end 

    def play 
        @board.populate
        @board.render

        until self.over == true          
        
        pos = @computerplayer.first_prompt # pos = [row, col]
        @previously_guessed = make_guess(pos)  
        card_one_value = @board[@previously_guessed].value 
        
        @computerplayer.receive_revealed_card(pos, card_one_value)
        self.reset_board

        second_pos = @computerplayer.second_prompt(pos, card_one_value)
        guessed_pos = make_guess(second_pos)
        card_two_value = @board[guessed_pos].value
        @computerplayer.receive_revealed_card(guessed_pos, card_two_value)
        self.reset_board

            if card_one_value == card_two_value && second_pos != pos
                puts "it's a match!"
                @computerplayer.receive_match(pos, second_pos)
                @previously_guessed = 0
                self.reset_board

               
            else
                puts "Try again"
                @board[guessed_pos].hide
                @board[@previously_guessed].hide
                @previously_guessed = 0
                self.reset_board
            end 
           
        end 
        sleep(3)
        system("clear")
        puts "you win!"
    end

    def reset_board
        sleep(2)
        system("clear")
        @board.render 
    end 

    def over
        if @board.won?
            true
        else 
            false
        end 
    end 


    def make_guess(pos)
        @board.reveal(pos)
        system("clear")
        @board.render
        
        return pos
    end 

if $PROGRAM_NAME == __FILE__
    mem = Memory_Game.new("board")    
    mem.play
end

end 



