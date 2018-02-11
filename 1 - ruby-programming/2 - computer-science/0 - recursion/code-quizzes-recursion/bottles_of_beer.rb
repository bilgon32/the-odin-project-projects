def bottles_of_beer(n)
  if n == 0
    print "No more bottles of beer on the wall\n"
  else
    print "#{n} bottles of beer on the wall\n"
    bottles_of_beer(n-1)
  end
end

bottles_of_beer(10)
bottles_of_beer(20)
bottles_of_beer(3)
