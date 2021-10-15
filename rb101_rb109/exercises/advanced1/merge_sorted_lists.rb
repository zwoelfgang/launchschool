def merge(array1, array2)
  array = []
  a1 = array1.dup
  a2 = array2.dup
  count1 = 0
  count2 = 0
  size1 = a1.size
  size2 = a2.size
  while !a1.empty? && !a2.empty?
    if a1[count1 - size1] && a2[count2 - size2] && a1[count1 - size1] <= a2[count2 - size2]
      array << a1.shift
      size1 -= 1
    elsif a1[count1 - size1] && a2[count2 - size2] && a1[count1 - size1] >= a2[count2 - size2]
      array << a2.shift
      size2 -= 1
    elsif a1[count2 - size1] && a2[count1 - size2] && a1[count2 - size1] <= a2[count1 - size2]
      array << a1.shift
      size1 -= 1
    elsif a1[count2 - size1] && a2[count1 - size2] && a1[count2 - size1] >= a2[count1 - size2]
      array << a2.shift
      size2 -= 1
    end
  end
  array.append(*a2) if a1.empty?
  array.append(*a1) if a2.empty?
  array
end

def merge_sort(array)
  return array if array.size == 1
  array1 = array[0..array.size / 2 - 1]
  array2 = array[array.size / 2..-1]
  array1 = merge_sort(array1)
  array2 = merge_sort(array2)
  array = merge(array1, array2)
end

merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]
