def merge_sort(array)
  return array if array.length == 1
  if array.length == 2
    return array[0] < array[1] || array[0] == array[1] ? [array[0], array[1]] : [array[1], array[0]]
  else
    a = array[0..(array.length/2)-1]
    b = array[(array.length/2)..array.length]
    result_a = merge_sort(a)
    result_b = merge_sort(b)
    final_array = []
    i,j,k = 0,0,0
    while i < result_a.length || j < result_b.length
      if result_a[i].nil?
        final_array[k] = result_b[j]
        k += 1
        j += 1
      elsif result_b[j].nil?
        final_array[k] = result_a[i]
        k += 1
        i += 1
      else
        if result_a[i] < result_b[j]
          final_array[k] = result_a[i]
          k += 1
          i += 1
        elsif result_a[i] > result_b[j]
          final_array[k] = result_b[j]
          k += 1
          j += 1
        else
          final_array[k] = result_a[i]
          final_array[k+1] = result_b[j]
          k += 2
          i += 1
          j += 1
        end
      end
    end
    return final_array
  end
end

puts "\n\nmerge_sort([1,6])"
p merge_sort([1,6])
puts "\n\nmerge_sort([6,1])"
p merge_sort([6,1])
puts "\n\nmerge_sort([20,125])"
p merge_sort([20,125])
puts "\n\nmerge_sort([1,2,3,4])"
p merge_sort([1,2,3,4])
puts "\n\nmerge_sort([125,9,4,300,8,42,2])"
p merge_sort([125,9,4,300,8,42,2])
puts "\n\nmerge_sort([125,9,4,300,8,42,2,125,9,4,300,8,42,2])"
p merge_sort([125,9,4,300,8,42,2,125,9,4,300,8,42,2])
