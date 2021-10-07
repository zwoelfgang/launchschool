def include?(array, integer)
  bool = false
  array.each { |num| bool = true if num == integer }
  bool
end

include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
