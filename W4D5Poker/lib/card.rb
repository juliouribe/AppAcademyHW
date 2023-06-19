SUITS = [:clubs, :diamonds, :hearts, :spades]
VALUES = {
  "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8,
  "9" => 9, "10" => 10, "J" => 10, "Q" => 10, "K" => 10, "A" => 11
}

class Card
  attr_reader :face, :value, :suit
  def initialize(face, suit)
    @face = face
    @value = VALUES[face]
    @suit = suit
    unless VALUES.include?(@face)
      raise ArgumentError.new(
        "Card must contain one of card values: 2-10, jack, queen, king, ace"
      )
    end
    unless SUITS.include?(@suit)
      raise ArgumentError.new(
        "Card must contain one of four suits: clubs, diamonds, hearts, or spades"
      )
    end
  end

  def to_s
    "#{@face} of #{suit}"
  end
end

# hearts_jack = Card.new("J", :hearts)
# puts hearts_jack
