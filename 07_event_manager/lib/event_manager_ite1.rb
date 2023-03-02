require 'csv'
puts 'EventManager initialized.'

# ------ 1 ------ #
# method 1: basic way
contents = CSV.open('event_attendees.csv', headers: true)
contents.each do |row|
    name = row[2]
    puts name
end
puts "------"

# ------ 2 ------ #
# method 2.1: converting headers to symbols
contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    puts name
end
puts "------"

# ------ 3 ------ #
# method 2.2: adding more header(s)
contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]
    puts "#{name}, #{zipcode}"
end
puts "------"