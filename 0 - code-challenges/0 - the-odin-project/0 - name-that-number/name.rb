phone = nil
while /\d\d\d\d-\w\w\w-\w\w\w\w/.match(phone) == nil
  puts "Enter a valid phone number: (0000-XXX-XXXX)"
  phone = gets.chomp
end
phone.upcase!

dictionary = []
File.open("words.txt").readlines.each do |word|
  dictionary << word.chomp.upcase if word.length < 9
end

# Method to replace letters with numbers
def replace(phone)
  phone.gsub!(/[ABC]/,"2")
  phone.gsub!(/[DEF]/,"3")
  phone.gsub!(/[GHI]/,"4")
  phone.gsub!(/[JKL]/,"5")
  phone.gsub!(/[MNO]/,"6")
  phone.gsub!(/[PQRS]/,"7")
  phone.gsub!(/[TUV]/,"8")
  phone.gsub!(/[WXYZ]/,"9")
  phone
end

phone_array = phone.split("-")
# Checks if both words are on the dictionary or if both of them joined form a word
if dictionary.include?(phone_array[1]) && dictionary.include?(phone_array[2]) || dictionary.include?(phone_array[1] + phone_array[2])
  phone_array[1] = replace(phone_array[1])
  phone_array[2] = replace(phone_array[2])
  phone = phone_array.join("-")
  puts "Output: #{phone}"
else
  puts "Word not found in dictionary"
end
