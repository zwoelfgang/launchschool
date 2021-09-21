hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each_value do |value|
  if value[:type] == 'fruit'
    upcase_colors = value[:colors].map { |item| item.capitalize }
    arr.push(upcase_colors)
  elsif value[:type] == 'vegetable'
    full_upcase_size = value[:size].chars.map { |item| item.upcase }
    arr.push(full_upcase_size.join)
  end
end

p arr