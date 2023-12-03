require "./lib/gear_ratio"

RSpec.describe GearRatio do
  let(:file) { "./fixtures/test_input.txt" }
  let(:gears) { GearRatio.new(file) }

  it "exists" do
    expect(gears).to be_an_instance_of(GearRatio)
  end

  describe "find_values_in_schematic" do
    xit "find values adjacent to or diagonal from a symbol" do
      expect(gears.find_values_in_schematic).to eq([467, 35, 633, 617, 592, 755, 664, 598])
    end
  end

  describe "find_symbol_coordinates" do
    it "finds the coordinates of symbols" do
      coordinate_arr = [[1, 3], [3, 6], [4, 3], [5, 5], [8, 3], [8, 5]]

      expect(gears.find_symbol_coordinates(gears.contents)).to eq(coordinate_arr)
    end
  end
end
