require "./lib/scratchcard"

RSpec.describe Scratchcard do
  let!(:test_input) { File.open("./input/test_input.txt") }
  let!(:scratchcard) { Scratchcard.new(test_input) }

  describe "instance methods" do
    context "initialize" do
      it "exists" do
        expect(scratchcard).to be_an_instance_of(Scratchcard)
        expect(scratchcard.data).to be_an(Array)
        expect(scratchcard.points).to eq(0)
        expect(scratchcard.total_cards).to be_a(Hash)
      end
    end

    context "#num_winning_numbers" do
      it "finds winning numbers in a card" do
        a = [41, 48, 83, 86, 17]
        b = [83, 86, 6, 31, 17, 9, 48, 53]

        expect(scratchcard.num_winning_numbers([a, b])).to eq(4)
      end
    end

    context "#parsed_line" do
      it "parses lines from input data" do
        card_1 = "Card 1: 41 48 83 86 17 | 83 86  6 31 17  9 48 53"
        a = [41, 48, 83, 86, 17]
        b = [83, 86, 6, 31, 17, 9, 48, 53]

        expect(scratchcard.parsed_line(card_1)).to eq([a, b])
      end
    end

    context "#scratch" do
      it "accumulates points for each line" do
        require 'pry'; binding.pry
        expect(scratchcard.scratch(scratchcard.data)).to eq([8, 2, 2, 1, 0, 0])
      end
    end

  end
end
