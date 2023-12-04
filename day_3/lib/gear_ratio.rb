class GearRatio
  attr_reader :contents

  def initialize(file)
    @contents = File.open(file).map do |line|
      line.chomp
    end
    @symbol_coordinates = []
  end

  # number of digits in number plus the line length
  # or
  # line length
  # 114 can can 10-14

  def find_symbol_coordinates(lines)
    x = 0
    y = 0

    lines.each do |line|
      line.scan(/[^.[:alnum]]/)
      arr = line.chars
      # unless arr[0] ==
    end

    require 'pry'; binding.pry
  end
end
