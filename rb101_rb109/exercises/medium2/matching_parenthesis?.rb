def balanced?(string)
  count = 0
  string.chars.each do |char|
    if char == '('
      count += 1
    elsif char == ')' && count != 0
      count -= 1
    elsif char == ')'
      count += 1
    end
    count
  end
  return true if count == 0
  false
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
