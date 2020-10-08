

class Humanplayer 

    def first_prompt
        puts "enter a position (coordinates) of a card separated with spaces like '2 3'"
        self.get_input
    end 

    def second_prompt
        puts "enter a position (coordinates) of a card separated with spaces like '2 3'"
        self.get_input
    end 

    def get_input
        gets.chomp.split(" ").map(&:to_i)
    end 


end 
