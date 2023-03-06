require 'csv'
require 'google/apis/civicinfo_v2'

def clean_zipcode(zipcode)
    zipcode.to_s.rjust(5, '0')[0..4]
end

def clean_phone(phone_number)
    # replace the additional characters with null
    tr = {'+' => '', '-' => '', '(' => '', ')' => '', ' ' => ''}
    tr.each do |find, replace|
        phone_number.gsub!(find, replace)
    end

    if phone_number.nil?
        phone_number = 'N/A'
    elsif phone_number.length < 10
        phone_number = 'Bad Number (too short)'
    elsif phone_number.length == 11
        if phone_number[0] == '1'
            phone_number = phone_number[1..10]
        else
            phone_number = 'Bad Number (invalid combination)'
        end
    elsif phone_number.length > 11
        phone_number = 'Bad Number (too long)'
    else
        phone_number
    end
end

def legislators_by_zipcode(zip)
    civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
    civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

    begin
        legislators = civic_info.representative_info_by_address(
            address: zip,
            levels: 'country',
            roles: ['legislatorUpperBody', 'legislatorLowerBody']
        )
        legislators = legislators.officials
        legislator_names = legislators.map(&:name)
        legislator_names.join(", ")
    rescue
        'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
    end
end

# ------ WIP ------ #
# def obtain_time(date_obj)
#     poggy = DateTime.parse(date_obj)
#     puts poggy.hour
# end

puts 'EventManager initialised.'

contents = CSV.open(
    'event_attendees.csv',
    headers: true,
    header_converters: :symbol
)

contents.each do |row|
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    phone = clean_phone(row[:homephone])
    puts "| #{name} | #{zipcode} | #{phone} |"
end