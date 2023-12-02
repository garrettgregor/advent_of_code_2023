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
end
