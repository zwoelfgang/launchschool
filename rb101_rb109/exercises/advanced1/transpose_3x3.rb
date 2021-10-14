matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

def transpose(outer_array)
  new_outer_array = []
  count = 0
  index = 1
  size = outer_array[0].size
  while count < size
    new_outer_array << [outer_array[0][count]]
    count += 1
  end
  count = 0
  while index < outer_array.size
    while count < size
      new_outer_array[count] << outer_array[index][count]
      count += 1
    end
    count = 0
    index += 1
    if outer_array[index] == nil
      size = 0
    else
      size = outer_array[index].size
    end
  end
  new_outer_array
end

new_matrix = transpose(matrix)

new_matrix == [[1, 4, 3],
               [5, 7, 9],
               [8, 2, 6]]
matrix == [[1, 5, 8],
           [4, 7, 2],
           [3, 9, 6]]

transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
          [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]