def average(num1,num2)
    (num1+num2)/2.to_f
end

def average_array(arr)
  arr.sum.to_f / arr.length
end

def repeat(str,num)
    return str*num
end

def yell(str)
  str.upcase+"!"
end

def alternating_case(str)
  arr = str.split(" ")

  arr.each_with_index do |word, idx|
    if idx.even?
      word.upcase!
    else
      word.downcase!
    end
  end
  arr.join(" ")
end