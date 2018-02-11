require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zip)
  civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
  civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

  begin
    civic_info.representative_info_by_address(
      address: zip,
      levels: 'country',
      roles: ['legislatorUpperBody', 'legislatorLowerBody']
    ).officials
  rescue
    "You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials"
  end
end

def save_thank_you_letter(id,form_letter)
  Dir.mkdir("output") unless Dir.exists?("output")

  filename = "output/thanks_#{id}.html"

  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def validate_phone_number(phone_number)
  phone_number = phone_number.scan(/\d+/).join
  if phone_number.length == 10 || phone_number.length == 11 && phone_number[0] == 1
    phone_number.to_s[-10..-1]
  else
    nil
  end
end

puts "EventManager Initialized!"

template_letter = File.read("form_letter.erb")
erb_template = ERB.new(template_letter)

valid_numbers = []
reg_hours = {}
reg_weekday = {}

contents = CSV.open("event_attendees.csv", headers: true, header_converters: :symbol)
contents.each do |row|
  id = row[0]
  name = row[:first_name]
  phone_number = validate_phone_number(row[:homephone])
  zipcode = clean_zipcode(row[:zipcode])
  reg_date = row[:regdate]

  # Return legislators by zipcode
  legislators = legislators_by_zipcode(zipcode)

  # Generate the letter from the erb template and saves into a unique file
  form_letter = erb_template.result(binding)
  save_thank_you_letter(id,form_letter)

  # Adds the phone number to the array if it's valid
  valid_numbers << phone_number if phone_number

  # Convert date to Date object and puts hour into "reg_hours" hash
  reg_date = DateTime.strptime(reg_date,'%m/%d/%y %k:%M')
  reg_hours[reg_date.hour].nil? ? reg_hours[reg_date.hour] = 1 : reg_hours[reg_date.hour] += 1
  reg_weekday[reg_date.wday].nil? ? reg_weekday[reg_date.wday] = 1 : reg_weekday[reg_date.wday] += 1
end

puts "Valid phone numbers: #{valid_numbers.join('-')}."
most_registers_hour = reg_hours.max_by { |hour,qty| qty }
most_registers_weekday = reg_weekday.max_by { |day,qty| qty }
days_week = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"]
puts "Hour of the day the most people registered: #{most_registers_hour[0]}:00 with #{most_registers_hour[1]} registers."
puts "Day of the week the most people registered: #{days_week[most_registers_weekday[0]]} with #{most_registers_weekday[1]} registers."
