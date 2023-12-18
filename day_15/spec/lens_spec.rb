require "./lib/lens.rb"

RSpec.describe Lens do
  let!(:test_input) { File.open("./fixtures/test_input.txt") }
  let!(:lens) { Lens.new(test_input) }

  describe "instance methods" do
    context "#initialize" do
      it "exists" do
        expect(lens).to be_a(Lens)
        expect(lens.data).to be_an(Array)
        expect(lens.data.length).to eq(11)
        expect(lens.hash_algorithm).to eq(1320)
      end
    end

    context "#ascii_values" do
      it "returns an array of integers based on ascii values" do
        expect(lens.ascii_values("rn=1")).to eq([114, 110, 61, 49])
        expect(lens.ascii_values("H")).to eq([72])
        expect(lens.ascii_values("HASH")).to eq([72, 65, 83, 72])
      end
    end

    context "#calculation" do
      it "returns an array of integers based on ascii values" do
        expect(lens.calculation([114])).to eq(146)
        expect(lens.calculation([72])).to eq(200)
        expect(lens.calculation([72, 65, 83, 72])).to eq(52)
      end
    end

    context "#hash_letters" do
      it "returns a value for a string based on the hash algorithm" do
        expect(lens.hash_letters("HASH")).to eq(52)
      end
    end
  end
end
