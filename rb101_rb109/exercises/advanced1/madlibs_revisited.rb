def madlibs
  hash = { 
          noun: ['dog', 'cat', 'bird', 'whale', 'dude'], adjective: ['sleepy', 'happy', 'nice', 'sweet', 'cunning'],
          verb: ['runs', 'fights', 'hacks', 'slashes', 'jumps'], adverb: ['funnily', 'stupidly', 'roughly', 'merrily', 'sadly']
         }
  File.open('madlibs.txt') do |file|
    file.each do |line|
      puts format(line, noun: hash[:noun].sample,
                        adjective: hash[:adjective].sample,
                        verb: hash[:verb].sample,
                        adverb: hash[:adverb].sample)
    end
  end
end

madlibs
