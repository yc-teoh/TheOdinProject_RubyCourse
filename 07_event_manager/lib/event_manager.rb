puts 'Event Manager Initialized!'

# ------ 1 ------ #
# bulk read csv lump-sum
contents = File.read('event_attendees.csv')
puts contents
puts "------"

# ------ 2 ------ #
# bulk read csv using loops
lines = File.readlines('event_attendees.csv')
lines.each do |line|
    puts line
end
puts "------"

# ------ 3 ------ #
# convert lines into arrays
lines = File.readlines('event_attendees.csv')
lines.each do |line|
    columns = line.split(",")
    p columns
end
puts "------"

# ------ 4 ------ #
# only display specific column
lines = File.readlines('event_attendees.csv')
lines.each do |line|
    columns = line.split(",")
    name = columns[2]
    puts name
end
puts "------"

# ------ 5 ------ #
# only display specific column, without the header row (fixed header row)
lines = File.readlines('event_attendees.csv')
lines.each do |line|
    next if line == " ,RegDate,first_Name,last_Name,Email_Address,HomePhone,Street,City,State,Zipcode\n"
    columns = line.split(",")
    name = columns[2]
    puts name
end
puts "------"

# ------ 6 ------ #
# only display specific column, without the header row (dynamic header row 1)
lines = File.readlines('event_attendees.csv')
row_index = 0
lines.each do |line|
    row_index = row_index + 1
    next if row_index == 1
    columns = line.split(",")
    name = columns[2]
    puts name
end
puts "------"

# ------ 7 ------ #
# only display specific column, without the header row (dynamic header row 2)
lines = File.readlines('event_attendees.csv')
lines.each_with_index do |line, index|
    next if index == 0
    columns = line.split(",")
    name = columns[2]
    puts name
end
puts "------"