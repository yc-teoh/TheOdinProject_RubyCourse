def bubble_sort(arr)
    for i in arr do
        arr.each_with_index do |number, index|
            i1 = index
            i2 = index+1
            n1 = arr[i1]
            n2 = arr[i2]

            # p n1
            # p n2
            
            if index != arr.length() - 1
                if n1 > n2
                arr[i2] = n1
                arr[i1] = n2
                end
            end

        end
    end

    return arr
end

p bubble_sort([4,3,78,2,0,2])
p bubble_sort([6,5,3,1,8,7,2,4])