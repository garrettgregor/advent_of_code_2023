class Scratchcard
  attr_reader :data, :points, :total_cards

  def initialize(input_file)
    @data = File.open(input_file).map { |line| line.chomp }
    @points = 0
    @total_cards = {}
  end

  def num_winning_numbers(numbers)
    winning_nums = numbers[0]
    scratcher_nums = numbers[1]

    winning_nums.intersection(scratcher_nums).length
  end

  def parsed_line(line)
    card_number = line.split(":").first
    @total_cards[card_number] = 1
    numbers_with_pipe = line.split(": ")
    string_nums = numbers_with_pipe[1].split(" | ")

    winning_nums = string_nums[0].split(/[[:space:]]/).reject { |num| num.empty? }.map do |number|
      number.to_i
    end

    scratcher_nums = string_nums[1].split(/[[:space:]]/).reject { |num| num.empty? }.map do |number|
      number.to_i
    end

    [winning_nums, scratcher_nums, card_number]
  end

  def scratch(data)
    parsed_lines = @data.map do |line|
      parsed_line(line)
    end

    parsed_lines.map do |line|
      require 'pry'; binding.pry
      if num_winning_numbers(line) == 0
        @points += 0
        0
      else
        @points += (2.pow(num_winning_numbers(line)-1))
        2.pow(num_winning_numbers(line)-1)
      end
    end
  end
end


scratcher = Scratchcard.new(File.open("./input/input.txt"))
scratcher.scratch(scratcher.data)

puts "---Part 1---"
puts scratcher.points
