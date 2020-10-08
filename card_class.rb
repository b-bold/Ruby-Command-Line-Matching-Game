# Card Class for Memory Game

class Card 

    attr_reader :value 
    
    def initialize(value)
        @face_down = true
        @value = value 
    end

    def hide
        @face_down = true 
    end 

    def reveal
        @face_down = false
    end 

    def to_s
        @value
    end 

    def ==(card_b)
        if self.to_s == card_b.to_s
            return true 
        else 
            return false 
        end 
    end 

    def display
        if @face_down == true
             " "
        else 
            @value 
        end 
    end 

    def has_been_revealed?
        !@face_down 
    end 

end 



