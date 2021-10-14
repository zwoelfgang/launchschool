matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

def rotate90(outer_array)
  new_outer_array = []
  count = outer_array[-1].size
  index = outer_array[-1].size
  while count > 0
    new_outer_array << [outer_array[-1][count]]
    count -= 1
  end
  count = outer_array[-2].size
  while index > outer_array.size
    while count > 0
      new_outer_array[count] << outer_array[index][count]
      count -= 1
    end
    count = outer_array[]
    index += 1
    if outer_array[index] == nil
      size = 0
    else
      size = outer_array[index].size
    end
  end
  new_outer_array
end

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1],
                  [9, 7, 5],
                  [6, 2, 8]]
p new_matrix2 == [[5, 3],
                  [1, 7],
                  [0, 4],
                  [8, 2]]
p new_matrix3 == matrix2