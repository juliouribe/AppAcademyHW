require "card"

describe Card do
  subject(:jack_hearts) { Card.new("J", :hearts)}
  let(:jack_spade) { Card.new("jack", :spades)}
  let(:jack_blades) { Card.new("J", :blades)}

  describe "#initialize" do
    context "When we initialize properly" do
      it "We should initliaze with a valid value and suit" do
        expect(jack_hearts.face).to eq("J")
      end

      it "We should be able to access all the card instance variables" do
        expect(jack_hearts.face).to eq("J")
        expect(jack_hearts.value).to eq(10)
        expect(jack_hearts.suit).to be(:hearts)
      end
    end
    context "When we initialize incorrectly" do
      it "We should raise an error when the suit is not valid" do
        expect { jack_blades }.to raise_error("Card must contain one of four suits: clubs, diamonds, hearts, or spades")
      end
      it "We should raise an error when the value is not valid" do
        expect { jack_spade }.to raise_error("Card must contain one of card values: 2-10, jack, queen, king, ace")
      end
    end
  end

  describe "#to_s" do
    it "Should return a nice string of the card's face and suit" do
      expect(jack_hearts.to_s).to eq("J of hearts")
    end
  end
end
