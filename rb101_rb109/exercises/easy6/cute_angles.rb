DEGREE = "\xC2\xB0"

def dms(angle)
  deg = angle.floor
  remainder = angle - deg
  min = (remainder * 60).floor
  sec = ((remainder * 60) % 60).round
  case
  when min >= 10 && sec >= 10
    p %(#{deg}#{DEGREE}#{min}'#{sec}")
  when min >= 10 && sec < 10
    p %(#{deg}#{DEGREE}#{min}'0#{sec}")
  when min < 10 && sec >= 10
    p %(#{deg}#{DEGREE}0#{min}'#{sec}")
  else
    p %(#{deg}#{DEGREE}0#{min}'0#{sec}")
  end
end

p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
