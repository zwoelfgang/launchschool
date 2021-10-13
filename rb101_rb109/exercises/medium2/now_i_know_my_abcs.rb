BLOCKS = [['B', 'O'], ['X', 'K'], ['D', 'Q'], ['C', 'P'], ['N', 'A'],
          ['G', 'T'], ['R', 'E'], ['F', 'S'], ['J', 'W'], ['H', 'U'],
          ['V', 'I'], ['L', 'Y'], ['Z', 'M']]

def block_word?(string)
  characters = string.upcase.chars
  !BLOCKS.any? { |el| el[0] =~ /#{characters}/ && el[1] =~ /#{characters}/ }
end

block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true
