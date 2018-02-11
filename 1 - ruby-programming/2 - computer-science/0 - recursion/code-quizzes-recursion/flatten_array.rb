def flatten_array(array)
  final_array = []
  array.each do |item|
    if item.is_a?(Array)
      final_array += flatten_array(item)
    else
      final_array << item
    end
  end
  puts "Result: #{final_array} of #{array}"
  return final_array
end

p flatten_array([[1, 2], [3, 4]])
p flatten_array([[1, [8, 9]], [3, 4]])
