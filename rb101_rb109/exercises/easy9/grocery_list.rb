def buy_fruit(array)
  new_array = []
  array.each do |sub_arr|
    sub_arr[1].times do
      new_array << sub_arr[0]
    end
  end
  new_array
end

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
