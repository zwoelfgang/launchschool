def switches(number)
  array = []
  hash = Hash.new
  (1..number).each do |key|
    hash[key] = 0
  end
  (1..number).each do |num|
    hash.map do |key, value|
      if key % num == 0
        if value == 0
          hash[key] = 1
        elsif value == 1
          hash[key] = 0
        end
      end
    end
  end
  hash.values.each_with_index { |num, index| array << index + 1 if num == 1 }
  array
end

switches(5) == [1, 4]
switches(10) == [1, 4, 9]
switches(1000)
