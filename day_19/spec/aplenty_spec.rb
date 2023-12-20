require "./lib/aplenty.rb"

RSpec.describe Aplenty do
  let!(:test_input) { File.open("./fixtures/test_input.txt") }
  let!(:aplenty) { Aplenty.new(test_input) }

  describe "instance methods" do
    context "#intialize" do
      it "exists" do
        expect(aplenty).to be_a(Aplenty)
        expect(aplenty.data).to be_an(Array)
        expect(aplenty.keys).to be_an(Array)
        expect(aplenty.keys.length).to eq(11)
        expect(aplenty.parts).to be_an(Array)
        expect(aplenty.parts.length).to eq(5)
      end
    end
  end
end
