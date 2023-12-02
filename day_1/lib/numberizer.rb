class Numberizer
  def numberize(string)
    output = string.gsub!(/[[:alpha:]]/, "")

    if output.length == 2
      output.to_i
    elsif output.length >= 3
      i = output.length - 1
      (output.slice(0) + output.slice(i)).to_i
    else
      (output + output).to_i
    end
  end

  def translate(string)
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

    until !string.include?("one") && !string.include?("two") && !string.include?("three") && !string.include?("four") && !string.include?("five") && !string.include?("six") && !string.include?("seven") && !string.include?("eight") && !string.include?("nine")
      pattern = Regexp.new(word_to_number.keys.map { |k| Regexp.escape(k) }.join('|'))
      result = string.gsub!(pattern) { |match| word_to_number[match] }
    end

    if !result.to_i == 0
      output = result.gsub!(/[[:alpha:]]/, "")
      if output.length == 2
        output.to_i
      elsif output.length >= 3
        i = output.length - 1
        (output.slice(0) + output.slice(i)).to_i
      else
        (output + output).to_i
      end
    else
      output = result.gsub!(/[[:alpha:]]/, "")
      result = (result.chars[0] + result.chars.last).to_i
    end
  end
end
