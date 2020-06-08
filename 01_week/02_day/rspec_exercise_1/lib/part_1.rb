def average(n1,n2)
    #accept two numbers as args
    #return average of the two numbers
    return (n1+n2)/2.to_f
end


def average_array(arr)
    #accept an array of numbers as args
    #return the average of the numbers of the array
    sum = arr.inject{|acc,x|acc+x}
    return (sum/arr.length.to_f)
end

# def repeat(str, n)
#     #accept string and a number as args
#     #Return new string where the original
#     #is repeated n, number, of times.
#     return str*n
# end

def repeat(str, n)
    tempStr = ""
    n.times do
        tempStr+= str
    end
    return tempStr
end


def yell(str)
    #should accept a string as arg
    #return a yelled version of string
    return str.upcase+"!"
end


def alternating_case(sentence)
    #accept a sentence string as arg
    #return the sentence with words
    #alternating between uppercase and 
    #lowercase
    arr = []
    arr = sentence.split(" ")
    arr.each_with_index do |ele,idx|
        #if idx is even
        if idx%2 == 0
            arr << ele.upcase
        else
            arr<< ele.downcase
        end
    end
    return arr.join(" ")
end