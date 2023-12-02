require "./lib/numberizer.rb"

class Trebuchet
  # Can't figure out how to use the numberizer instead of just placing the method here
  # n = Numberizer.new
  def self.numberize(string)
    # output = string.gsub(/[[:alpha:]]/, "")

    # if output.length == 2
    #   output.to_i
    # elsif output.length >= 3
    #   i = output.length - 1
    #   (output.slice(0) + output.slice(i)).to_i
    # else
    #   (output + output).to_i
    # end
    word_to_number = {
      "one" => 1,
      "two" => 2,
      "three" => 3,
      "four" => 4,
      "five" => 5,
      "six" => 6,
      "seven" => 7,
      "eight" => 8,
      "nine" => 9
    }

    #convert all written numbers to integers
    until !string.include?("one") && !string.include?("two") && !string.include?("three") && !string.include?("four") && !string.include?("five") && !string.include?("six") && !string.include?("seven") && !string.include?("eight") && !string.include?("nine")
      pattern = Regexp.new(word_to_number.keys.map { |k| Regexp.escape(k) }.join('|'))
      string.gsub!(pattern) { |match| word_to_number[match] }
    end

    # if the string has any letter still in it...
    ## Leaving off trying to account for strings the start with integers or only have one integer present

    # If string has only letters in it
    # if the string starts with an integer, it will be represented only as that
    if string.to_i == 0
      output = string.gsub!(/[[:alpha:]]/, "")
      if output.chars.length == 2
        output.to_i
      elsif output.length >= 3
        i = output.length - 1
        (output.slice(0) + output.slice(i)).to_i
      else
        (output + output).to_i
      end
    else
      (string.chars[0] + string.chars.last).to_i
    end
  end

  numbers = []
  File.open('calibration_document.txt').each do |line|
    numbers << numberize(line.strip)
  end

  p numbers.sum
end
