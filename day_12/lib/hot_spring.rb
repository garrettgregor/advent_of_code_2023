class HotSpring
  attr_reader :contents

  def initialize(file)
    @contents = File.open(file).map { |line| line.chomp }
  end

end
