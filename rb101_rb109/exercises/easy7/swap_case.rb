def swapcase(string)
  characters = string.chars.map do |char|
    if 'abcdefghijklmnopqrstuvwxyz'.include?(char)
      char.upcase
    elsif 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.include?(char)
      char.downcase
    else
      char
    end
  end
  characters.join
end

swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
