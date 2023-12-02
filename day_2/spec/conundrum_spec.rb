require "./lib/conundrum"

RSpec.describe Conundrum do
  describe "possible?" do
    it "checks which games were possible with given constraints" do
      conundrum = Conundrum.new
      a = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      b = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
      # Impossible
      c = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      # Impossible
      d = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
      e = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

      ### constraints: 12 red cubes, 13 green cubes, and 14 blue cubes?
      ## Possible games: game 1, 2 and 5
      ## 1 + 2 + 5 = 8

      expect(conundrum.possible?(a)).to be(True)
      expect(conundrum.possible?(b)).to be(True)
      expect(conundrum.possible?(c)).to be(False)
      expect(conundrum.possible?(d)).to be(False)
      expect(conundrum.possible?(e)).to be(True)
    end
  end
end
