puts 'Write text'
string = gets.chomp
puts 'Choose code'
key = gets.chomp.to_i % 26

def cipher(string, key)
  c_string = string.chars.map do |c|
    case c
    when 'a'..'z'
      num = c.ord + key
      if num > 'z'.ord
        (num - 26).chr
      else
        num.chr
      end
    when 'A'..'Z'
      num = c.ord + key
      if num > 'Z'.ord
        (num - 26).chr
      else
        num.chr
      end
    else
      c
    end
  end
  c_string.join
end

puts cipher(string, key)
