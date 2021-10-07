def palindrome?(string)
  string == string.reverse
end

def real_palindrome?(string)
  new_string = string.downcase.chars.reject { |char| !'abcdefghijklmnopqrstuvwxyz'.include?(char) }.join
  palindrome?(new_string)
end

def palindromic_number?(integer)
  new_string = integer.to_s
  palindrome?(new_string)
end

palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
