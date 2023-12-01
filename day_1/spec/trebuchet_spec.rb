# frozen_string_literal: true

RSpec.describe Trebuchet do
  describe "trebuchets" do
    it "converts strings to values appropriately" do
      a = "1abc2"
      b = "pqr3stu8vwx"
      c = "a1b2c3d4e5f"
      d = "treb7uchet"
      require 'pry'; binding.pry

      expect(Trebuchet.numberize(a)).to eq(12)
      expect(Trebuchet.numberize(b)).to eq(38)
      expect(Trebuchet.numberize(c)).to eq(15)
      expect(Trebuchet.numberize(d)).to eq(77)
    end
  end
end
