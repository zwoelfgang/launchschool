def print(n)
  puts n
end

def pop(array)
  array.pop
end

def push(n, array)
  array << n
end

def minilang(string)
  array = string.split(' ')
  stack = []
  register = 0
  array.each do |item|
    case item
    when 'PRINT'
      print(register)
    when 'POP'
      register = pop(stack)
    when 'PUSH'
      push(register, stack)
    when 'ADD'
      register += pop(stack)
    when 'SUB'
      register -= pop(stack)
    when 'MULT'
      register *= pop(stack)
    when 'DIV'
      register /= pop(stack)
    when 'MOD'
      register %= pop(stack)
    else
      register = item.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)
