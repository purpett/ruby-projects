def stock_picker(days)
  b = 0
  best_profit = 0
  location = []
  while b < days.length
    s = b + 1
    while s < days.length
      profit = days[s] - days[b]
      if profit > best_profit
        best_profit = profit
        location = [b, s]
      end
      s += 1
    end
    b += 1
  end
  location
end

puts stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])
