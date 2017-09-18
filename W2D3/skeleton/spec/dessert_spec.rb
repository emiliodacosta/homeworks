require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:flan) { Dessert.new("flan", 10, chef)}
  let(:chef) { double("chef", name: "Jojo") }

  describe "#initialize" do
    it "sets a type" do
      expect(flan.type).to eq('flan')
    end
    it "sets a quantity" do
      expect(flan.quantity).to eq(10)
    end
    it "starts ingredients as an empty array" do
      expect(flan.ingredients).to eq([])
    end
    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("flan", "hella", "Jojo") }.to raise_error(ArgumentError)
    end
  end


  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      flan.add_ingredient("ingredient")
      expect(flan.ingredients).to include("ingredient")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["sugar", "eggs", "milk", "vanilla"]

      ingredients.each do |ingredient|
        flan.add_ingredient(ingredient)
      end

      expect(flan.ingredients).to eq(ingredients)

      flan.mix!
      expect(flan.ingredients).not_to eq(ingredients)
      expect(flan.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      flan.eat(1)
      expect(flan.quantity).to eq(9)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { flan.eat(11) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Jojo the Great Baker")
      expect(flan.serve).to eq("Chef Jojo the Great Baker has made 10 flans!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(flan)
      flan.make_more
    end


  end
end
