require 'date'

def friday_13th(year)
  count = 0
  (1..12).each do |month|
    if Date.new(year, month, 13).friday?
      count += 1
    end
  end
  count
end

friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2
