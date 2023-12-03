require "./lib/conundrum"

RSpec.describe Conundrum do
  describe "possible?" do
    it "checks which games were possible with given constraints" do
      file = File.open("./fixtures/input.txt")
      conundrum = Conundrum.new(file)

      a = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      b = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
      c = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      d = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
      e = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

      expect(conundrum.possible?(a)).to be(true)
      expect(conundrum.possible?(b)).to be(true)
      expect(conundrum.possible?(c)).to be(false)
      expect(conundrum.possible?(d)).to be(false)
      expect(conundrum.possible?(e)).to be(true)
    end
  end

  describe "sum_possible_games" do
    it "gives a sum of the games that were possible" do
      file = File.open("./fixtures/input.txt")
      conundrum = Conundrum.new(file)

      games = ["Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green", "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue", "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red", "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red", "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"]
      expect(conundrum.sum_possible_games(games)).to eq(8)
    end
  end

  describe "min_per_game" do
    it "gives a minimum amount of cubes per color that was required per game" do
      file = File.open("./fixtures/input.txt")
      conundrum = Conundrum.new(file)

      a = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      b = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
      c = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      d = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
      e = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

      expect(conundrum.min_per_game(a)).to eq({"blue" => 6, "red" => 4, "green" => 2})
      expect(conundrum.min_per_game(b)).to eq({"blue" => 4, "red" => 1, "green" => 3})
      expect(conundrum.min_per_game(c)).to eq({"blue" => 6, "red" => 20, "green" => 13})
      expect(conundrum.min_per_game(d)).to eq({"blue" => 15, "red" => 14, "green" => 3})
      expect(conundrum.min_per_game(e)).to eq({"blue" => 2, "red" => 6, "green" => 3})
    end
  end

  describe "power_per_game" do
    it "gives a minimum amount of cubes per color that was required per game" do
      file = File.open("./fixtures/input.txt")
      conundrum = Conundrum.new(file)

      a = "Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green"
      b = "Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue"
      c = "Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red"
      d = "Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red"
      e = "Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green"

      expect(conundrum.power_per_game(a)).to eq(48)
      expect(conundrum.power_per_game(b)).to eq(12)
      expect(conundrum.power_per_game(c)).to eq(1560)
      expect(conundrum.power_per_game(d)).to eq(630)
      expect(conundrum.power_per_game(e)).to eq(36)
    end
  end
end
