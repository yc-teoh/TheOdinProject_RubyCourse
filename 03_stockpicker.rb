def stock_picker(arr)
    highest_profit = 0
    highest_profit_buy = 0
    highest_profit_sell = 0

    arr.each_with_index do |price, index|
        puts "\n#{index} => #{price} \n---"

        curr_buy = price

        arr[index..-1].each_with_index do |price2, index2|
            updated_index = index2 + index    # index from the original array
            puts "#{updated_index} => #{price2} \n"

            profit = price2 - price

            if profit >= highest_profit
                highest_profit = profit
                highest_profit_buy = index
                highest_profit_sell = updated_index
            end
            
        end

    end
    
    result = [highest_profit_buy, highest_profit_sell]

    return result
end

p stock_picker([17,3,6,9,15,8,6,1,10])