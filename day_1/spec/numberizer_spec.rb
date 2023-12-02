require "./lib/numberizer"

RSpec.describe Numberizer do
  describe "numberize" do
    it "converts strings to values appropriately" do
      n = Numberizer.new

      a = "1abc2"
      b = "pqr3stu8vwx"
      c = "a1b2c3d4e5f"
      d = "treb7uchet"

      expect(n.numberize(a)).to eq(12)
      expect(n.numberize(b)).to eq(38)
      expect(n.numberize(c)).to eq(15)
      expect(n.numberize(d)).to eq(77)
    end
  end
end
