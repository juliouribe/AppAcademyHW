require_relative 'card'

class Deck
  attr_reader :new_deck, :shuffled_deck

  def initialize
    @new_deck = []
    SUITS.each do |suit|
      VALUES.each_key do |face|
        @new_deck << Card.new(face, suit)
      end
    end
  end

  def shuffle
    @shuffled_deck = @new_deck.shuffle
  end

  def draw
    @shuffled_deck.pop
  end

  def peek
    @shuffled_deck[-1]
  end
end
