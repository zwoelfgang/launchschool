produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

def select_fruit(groceries)
  groceries.select { |key, value| value == "Fruit" }
end

p select_fruit(produce)