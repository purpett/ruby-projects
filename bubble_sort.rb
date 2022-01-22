def bubble_sort(list)
  i = 0
  while i < list.length
    j = i + 1
    while j < list.length
      if list[i] > list[j]
        tmp = list[j]
        list[j] = list[i]
        list[i] = tmp
      end
      j += 1
    end
    i += 1
  end
  list
end

puts bubble_sort([7, -3, 0, 13, 25, 1, -12, 6])
