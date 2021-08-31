def name(n)
  return s_name = n[rand(n.size)]
end

def activity(a)
  return s_activity = a[rand(a.size)]
end

def sentence(n, a)
  return "#{n} went #{a} today!"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))