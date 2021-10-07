def cleanup(string)
  counter = 0
  cleaned_string = string.chars.map do |char| 
    if !"abcdefghijklmnopqrstuvwxyz".include?(char)
      if counter >= 1
        counter += 1
        char = ''
      else
        counter += 1
        char = ' '
      end
    else
      counter = 0
      char
    end
  end
  cleaned_string.join
end

cleanup("---what's my +*& line?") == ' what s my line '
