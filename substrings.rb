dictionary = %w[below down go going horn how howdy it i low own part partner sit]

def substrings(string, dictionary)
  list = Hash.new(0)
  string.downcase!
  dictionary.each do |word|
    i = 0
    while i < string.length
      list[word] += 1 if word == string[i, word.length]
      i += 1
    end
  end

  list
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)
