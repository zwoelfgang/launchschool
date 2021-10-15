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
  count = 0
  inner_size = outer_array[-1].size - 1
  outer_size = outer_array.size
  while count <= inner_size
    new_outer_array << [outer_array[-1][count]]
    count += 1
  end
  count = 0
  index = 2
  while index <= outer_size
    while count <= inner_size
      new_outer_array[count] << outer_array[-index][count]
      count += 1
    end
    count = 0
    index += 1
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