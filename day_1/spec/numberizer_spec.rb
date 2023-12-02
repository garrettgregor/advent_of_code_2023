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

  describe "translate" do
    it "converts strings to values appropriately" do
      n = Numberizer.new

      a = "two1nine"
      b = "eightwothree"
      c = "abcone2threexyz"
      d = "xtwone3four"
      e = "4nineeightseven2"
      f = "zoneight234"
      g = "7pqrstsixteen"

      expect(n.translate(a)).to eq(29)
      expect(n.translate(b)).to eq(83)
      expect(n.translate(c)).to eq(13)
      expect(n.translate(d)).to eq(24)
      expect(n.translate(e)).to eq(42)
      expect(n.translate(f)).to eq(14)
      expect(n.translate(g)).to eq(76)
    end
  end
end
