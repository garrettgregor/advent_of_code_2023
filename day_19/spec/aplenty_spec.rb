require "./lib/aplenty.rb"

RSpec.describe Aplenty do
  let!(:test_input) { File.open("./fixtures/test_input.txt") }
  let!(:aplenty) { Aplenty.new(test_input) }

  describe "instance methods" do
    context "#intialize" do
      it "exists" do
        expect(aplenty).to be_a(Aplenty)
      end
    end
  end
end
