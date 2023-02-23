def caesar_cipher(hello, level)
    arr = []

    # converting the string input into ASCII code
    # modify values according to the `level` input
    hello.each_byte do |c|
        is_uppercase = false
        is_lowercase = false

        if c.between?(65,90)
            is_uppercase = true
        elsif c.between?(97,122)
            is_lowercase = true
        end

        modifiedASCII = c + level
        if is_uppercase == true
            if modifiedASCII > 90
                surplus = modifiedASCII - 90
                asciiBegin = 64 + surplus
                arr.push(asciiBegin)
            else
                arr.push(modifiedASCII)
            end
        elsif is_lowercase == true
            if modifiedASCII > 122
                surplus = modifiedASCII - 122
                asciiBegin = 97 + surplus
                arr.push(asciiBegin)
            else
                arr.push(modifiedASCII)
            end
        else
            arr.push(c)
        end
    end

    result = ""
    arr.each do |hello|
        result += hello.chr
    end

    return result + "\n\n"
end

puts caesar_cipher("What a string!", 5)