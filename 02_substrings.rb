dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
# p dictionary

def substrings(input, dict_source)
    # hash
    output = {}

    # looping each definition of dictionary
    # `index` being each word in the dictionary
    dict_source.each do |index|
        count_substring_appears = input.scan(index).size
        p input.scan(index)

        if count_substring_appears > 0
            output[index] = count_substring_appears
        end
    end

    return output
end

puts substrings("Howdy partner, sit down! How's it going?", dictionary)