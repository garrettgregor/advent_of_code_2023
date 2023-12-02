class Conundrum
  attr_reader :game_counter, :contents, :possible_game_collector

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
  end

  def possible?(string)
    cleaned_game = Hash.new

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
end

puzzle = Conundrum.new('./fixtures/input.txt')
p puzzle.sum_possible_games(puzzle.contents)
