class Conundrum
  attr_reader :game_counter,
              :contents,
              :possible_game_collector,
              :power_sum

  def initialize(file)
    @contents = File.open(file).map do |line|
      line.chomp
    end
    @possible_game_collector = []
    @constraints = {
      "red" => 12,
      "green" => 13,
      "blue" => 14
    }
    @power_sum = 0
  end

  def possible?(string)
    string.delete_prefix!("Game ")

    game_number = string.split(/[[:punct:]]/).shift.to_i
    pattern = /: |; |, /
    game_data = string.split(pattern)
    game_data.shift

    each_draw = []

    game_data.map do |draw|
      each_draw << [draw.split(" ").first.to_i, draw.split(" ")[1].to_s]
    end

    valid_games = []

    each_draw.each do |num_drawn, color|
      valid_games << (@constraints[color] >= num_drawn)
    end

    if !valid_games.any?(false)
      @possible_game_collector << game_number
      true
    else
      false
    end
  end

  def sum_possible_games(games)
    games.each do |game|
      possible?(game)
    end
    @possible_game_collector.sum
  end

  def min_per_game(game)
    game_mins = { "blue" => 0, "red" => 0, "green" => 0}

    pattern = /: |; |, /
    game_data = game.split(pattern)
    game_data.shift

    each_draw = []

    game_data.map do |draw|
      each_draw << [draw.split(" ").first.to_i, draw.split(" ")[1].to_s]
    end

    each_draw.each do |num_drawn, color|
      if game_mins[color] <= num_drawn
        game_mins[color] = num_drawn
      end
    end

    game_mins
  end

  def power_per_game(game)
    min_hash = min_per_game(game)

    green_min = min_hash["green"]
    blue_min = min_hash["blue"]
    red_min = min_hash["red"]

    power = (green_min * blue_min * red_min)
  end

  def sum_powers(games)
    games.each do |game|
      @power_sum += power_per_game(game)
    end

    @power_sum
  end
end

puzzle = Conundrum.new('./fixtures/input.txt')
p "--- Sum of Possible Games ---\n"
p puzzle.sum_possible_games(puzzle.contents)
p "--- Sum of Powers ---\n"
p puzzle.sum_powers(puzzle.contents)
