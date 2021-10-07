def time_of_day(integer)
  hrs = 0
  mins = 0
  if integer != integer.abs
    integer = integer.abs
    while integer > 0
      hrs = 24
      while hrs > 0
        mins = 60
        while mins > 0
          integer -= 1
          mins -= 1
          break if integer <= 0
        end
        break if integer <= 0
        hrs -= 1
      end
    end
    case
    when hrs == 24
      hrs = 23
    when mins == 60
      hrs -= 1
      mins = 59
    else
      hrs -= 1
    end
  else
    while integer > 0
      hrs = 0
      while hrs < 24
        mins = 0
        while mins < 60
          integer -= 1
          mins += 1
          break if integer <= 0
        end
        break if integer <= 0
        hrs += 1
      end
    end
    case
    when hrs == 24
      hrs = 0
    when mins == 60
      hrs += 1
      mins = 0
    end
  end
  case
  when hrs.digits.size < 2 && mins.digits.size < 2
    "0#{hrs}:0#{mins}"
  when hrs.digits.size >= 2 && mins.digits.size < 2
    "#{hrs}:0#{mins}"
  when hrs.digits.size < 2 && mins.digits.size >= 2
    "0#{hrs}:#{mins}"
  else
    "#{hrs}:#{mins}"
  end
end

def before_midnight(string)
  hrs = string.split(':').map { |num| num.to_i }[0]
  mins = string.split(':').map { |num| num.to_i }[1]
  if hrs != 24 && (hrs != 0 && mins != 0)
    mins = (24 * 60 - (hrs * 60)) - mins
  end
  mins
end

def after_midnight(string)
  hrs = string.split(':').map { |num| num.to_i }[0]
  mins = string.split(':').map { |num| num.to_i }[1]
  if hrs != 24
    mins += hrs * 60
  end
  mins
end

time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
