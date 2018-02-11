def palindrome(string)
  p string = string.scan(/\w+/).join.downcase
  return string[0] == string[-1] if string.length <= 2
  return false if string[0] != string[-1]
  return palindrome(string[1..-2]) && string[0] == string[-1]
end
p palindrome("A but tuba.")
p palindrome("A car, a man, a maraca.")
p palindrome("This is not a palindrome.")
