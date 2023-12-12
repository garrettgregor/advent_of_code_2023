require "./lib/hot_spring"

RSpec.describe HotSpring do
  let!(:test_input) { File.open("./fixtures/test_input.txt") }
  let!(:hot_spring) { HotSpring.new(test_input) }

  describe "instance methods" do
    context "initialize" do
      it "exists" do
        expect(hot_spring).to be_an_instance_of(HotSpring)
        expect(hot_spring.contents).to be_an(Array)
      end
    end
  end
end
