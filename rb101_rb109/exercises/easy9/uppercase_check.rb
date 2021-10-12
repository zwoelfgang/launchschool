def uppercase?(string)
  array = string.chars
  bool = true
  array.each do |char|
    if char =~ /[a-z]/
      bool = false
    end
  end
  bool
end

uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true
