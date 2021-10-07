def xor?(bool1, bool2)
  if (bool1 == true && bool2 == false) || (bool1 == false && bool2 == true)
    true
  else
    false
  end
end

xor?(5.even?, 4.even?) == true
xor?(5.odd?, 4.odd?) == true
xor?(5.odd?, 4.even?) == false
xor?(5.even?, 4.odd?) == false
