DIGITS = {
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
  '0' => 0,
}

def string_to_integer(string)
  array = string.chars.reverse
  new_array = []
  array.each_with_index do |num, index|
    new_array << (DIGITS.select { |key, _| key == num }[num] * (10 ** index))
  end
  new_array.sum
end

string_to_integer('4321') == 4321
string_to_integer('570') == 570
