numbers = [5, 9, 21, 26, 39]

divisible_by_three = numbers.select {|element| if element % 3 == 0 then element end}

p divisible_by_three