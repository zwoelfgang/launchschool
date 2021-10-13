def letter_percentages(string)
  hash = {}
  lower = 0
  upper = 0
  none = 0
  string.chars.each do |char|
    if 'abcdefghijklmnopqrstuvwxyz'.include?(char)
      lower += 1
    elsif 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(char)
      upper += 1
    else
      none += 1
    end
  end
  total = lower + upper + none
  hash[:lowercase] = lower / total.to_f * 100
  hash[:uppercase] = upper / total.to_f * 100
  hash[:neither] = none / total.to_f * 100
  hash
end

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
