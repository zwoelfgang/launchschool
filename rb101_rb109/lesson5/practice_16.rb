HEX = %w(0 1 2 3 4 5 6 7 8 9 a b c d e f)

def create_uuid()
  uuid = ''
  for i in (1..8)
    uuid.concat(HEX.sample)
  end
  uuid += '-'
  for j in (1..3)
    for k in (1..4)
      uuid.concat(HEX.sample)
    end
    uuid += '-'
  end
  for l in (1..12)
    uuid.concat(HEX.sample)
  end
  uuid
end

p create_uuid