def Add(string)
  numbers = string.split(",")
  sum = 0
  numbers.each do |n|
    sum += n
  end
  sum
end
