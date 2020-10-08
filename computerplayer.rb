require "byebug"


class Computerplayer

    attr_reader :matched_cards, :known_cards

    def initialize 
        @matched_cards = []
        @known_cards = Hash.new()
        @unmatched_known_cards = Hash.new()
    end 
        
    def first_prompt
        puts "enter a position (coordinates) of a card separated with spaces like '2 3'"
        
        self.get_unmatched_known_cards_hash

        @unmatched_known_cards.each do |pos, val|
            @unmatched_known_cards.each do |pos2, value2|
                if val == value2 && pos != pos2
                    return pos
                end 
            end
        end 

        return hasnt_been_guessed_yet
    end 
    

    def second_prompt(position, first_prompt_card_value)
        self.get_unmatched_known_cards_hash

        @unmatched_known_cards.each do |previously_seen_position, value|
            if value == first_prompt_card_value && previously_seen_position != position
                return previously_seen_position
            end 
        end 

        return hasnt_been_guessed_yet
    end 

    def receive_revealed_card(new_position, new_value)
        @known_cards[new_position] = new_value
    end 

    def receive_match(pos1, pos2)
        @matched_cards << pos1
        @matched_cards << pos2
    end 

    def hasnt_been_guessed_yet
        possible_positions = [0,0,1,1,2,2,3,3] 
        truly_random = false
        
        while truly_random == false
        random_guess = possible_positions.sample(2)

            if !@known_cards.include?(random_guess)
                truly_random = true
            end 
        end 

        random_guess
    end 

    def get_unmatched_known_cards_hash
        @unmatched_known_cards = @known_cards.clone

        @known_cards.each do |position, value|
            if @matched_cards.include?(position)
                @unmatched_known_cards.delete(position)
            end 
        end

        @unmatched_known_cards
    end 
end 