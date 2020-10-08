# test methods here in small chunks 
require "byebug"

def get_unmatched_known_cards_hash(known_cards, matched_cards)
    unmatched_known_cards = known_cards.clone
    # debugger
    
    known_cards.each do |position, value|
        if matched_cards.include?(position)
            unmatched_known_cards.delete(position)
        end 
    end

    unmatched_known_cards
end 

p get_unmatched_known_cards_hash({ [0,0]=>1, [1,2]=>6, [1,3]=>6, [3,3]=>7 }, [[1,2], [1,3]]) # => {[0,0]=>1,[3,3]=>7}
