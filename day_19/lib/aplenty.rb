class Aplenty
  attr_reader :data, :keys, :parts

  def initialize(input_file)
    @keys = []
    @parts = []
    @data = File.open(input_file).map do |line|
      if line.start_with?(/[[:alpha:]]/)
        @keys << line.chomp
      elsif line.start_with?("{")
        @parts << line.chomp
      end
    end
  end
end
