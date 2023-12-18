class Lens
  attr_reader :data

  def initialize(input_file)
    @data = File.open(input_file).flat_map { |line| line.chomp.split(",") }
  end

  def ascii_values(string)
    # take string and parse to array of integers based on ascii values
    string.bytes
  end

  def calculation(array)
    current_value = 0
    # take array of ascii values and return a single number based on instructions
    array.each do |char|
      # increase current value by ascii code
      current_value += char
      # set current value to itself multiplied by 17
      current_value = current_value * 17
      # set current value to remainder of dividing itself by 256
      current_value = current_value % 256
    end
    # return current_value after all characters have been processed
    current_value
  end

  def hash_letters(string)
    calculation(ascii_values(string))
  end

  def hash_algorithm
    total = 0

    self.data.each do |string|
      total += hash_letters(string)
    end

    total
  end
end

lens = Lens.new("./fixtures/input.txt")

puts "--- Part One ---"
puts lens.hash_algorithm
