# Write a method #fibs which takes a number and returns that many members
# of the fibonacci sequence. Use iteration for this solution.
def fibs(n)
  array = [0,1]
  return array[0..n] if n <= 1
  2.upto(n) do |i|
    item = array[i - 1] + array[i - 2]
    array << item
  end
  array
end

p fibs(0)
p fibs(1)
p fibs(2)
p fibs(3)
p fibs(4)
p fibs(5)
p fibs(6)
p fibs(7)
p fibs(8)
