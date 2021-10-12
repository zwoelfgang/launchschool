def staggered_case(string)
  count = 0
  characters = string.chars.map do |char|
    if 'abcdefghijklmnopqrstuvwxyz'.include?(char.downcase)
      if count.even?
        char = char.upcase
        count += 1
      else
        char = char.downcase
        count += 1
      end
    end
    char
  end
  characters.join
end

staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
