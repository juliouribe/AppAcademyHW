require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Ramsay") }
  subject(:cookie) { Dessert.new("cookie", 5, chef)}

  describe "#initialize" do
    it "sets a type" do
      expect(cookie.type).to eq("cookie")
    end

    it "sets a quantity" do
      expect(cookie.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(cookie.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do
      expect {Dessert.new("cake", "4", chef)}
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cookie.add_ingredient("sugar")
      expect(cookie.ingredients).to eq(["sugar"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      cookie.add_ingredient("sugar")
      cookie.add_ingredient("eggs")
      cookie.add_ingredient("flour")
      expect(cookie.ingredients).to eq(["sugar", "eggs", "flour"])
      cookie.mix!
      expect(cookie.ingredients).not_to equal(["sugar", "eggs", "flour"])
      expect(cookie.ingredients.sort).not_to equal(["sugar", "eggs", "flour"].sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cookie.eat(1)
      expect(cookie.quantity).to eq(4)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { cookie.eat(10) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Ramsay the Great Baker")
      expect(cookie.serve).to eq("Chef Ramsay the Great Baker has made 5 cookies!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(cookie)
      cookie.make_more
    end
  end
end
