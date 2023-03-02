require 'csv'
puts 'EventManager initialized.'

contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

# ------ 1 ------ #
contents.each do |row|
    name = row[:first_name]
    zipcode = row[:zipcode]

    # [CASE 1] If the ZIP code is EXACTLY five digits,
    # assume that it is okay.

    # [CASE 2] If the ZIP code is MORE THAN five digits,
    # truncate it to the first five digits.

    # [CASE 3] If the ZIP code is LESS THAN five digits,
    # add zeroes to the front until it becomes five digits.

    if zipcode.nil?
        zipcode = '00000'
    elsif zipcode.length < 5
        zipcode = zipcode.rjust(5, '0')
    elsif zipcode.length > 5
        zipcode = zipcode[0..4]
    end

    puts "#{name}, #{zipcode}"
end
puts "------"

# ------ 2 ------ #
# put the ZIP cleaner function in a method
contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

def clean_zipcode(zipcode)
    if zipcode.nil?
        '00000'
    elsif zipcode.length < 5
        zipcode.rjust(5, '0')
    elsif zipcode.length > 5
        zipcode[0..4]
    else
        zipcode
    end
end

contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    puts "#{name}, #{zipcode}"
end
puts "------"

# ------ 3 ------ #
# A more succinct method
contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    puts "#{name}, #{zipcode}"
end
puts "------"