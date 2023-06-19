require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  let(:card) { Card.new("2", :clubs) }
  let(:deck2) { Deck.new }

  describe "#intialize" do
    it "Should start the deck with 52 cards" do
      expect(deck.new_deck.length).to eq(52)
    end
    it "Deck should contain instances of the card class" do
      expect(deck.new_deck[0].face).to eq(card.face)
    end
    it "Should contain 12 cards for each value for each suit" do
      heart_count = deck.new_deck.count { |card| card.suit == :hearts}
      spade_count = deck.new_deck.count { |card| card.suit == :spades}
      club_count = deck.new_deck.count { |card| card.suit == :clubs}
      diamond_count = deck.new_deck.count { |card| card.suit == :diamonds}
      expect(heart_count).to eq(13)
      expect(spade_count).to eq(13)
      expect(club_count).to eq(13)
      expect(diamond_count).to eq(13)
    end
    it "Should have a reader for an unshuffled deck" do
      expect(deck.new_deck.is_a?(Array)).to eq(true)
    end
  end

  describe "#shuffle" do
    it "Shuffle method should shuffle the cards" do
      expect(deck.new_deck).to receive(:shuffle)
      deck.shuffle
    end
    it "Should always return 52 cards to simulate 'gathering' the cards" do
      deck.shuffle
      5.times { deck.draw }
      deck.shuffle
      expect(deck.shuffled_deck.length).to eq(52)
    end
  end

  describe "#peek" do
    it "Should show the top card" do
      deck.shuffle
      expect(deck.peek).to eq(deck.shuffled_deck[-1])
    end
  end

  describe "#deal" do
    it "Deal out a one card at a time" do
      deck.shuffle
      deck.draw
      expect(deck.shuffled_deck.length).to eq(51)
    end
  end
end
