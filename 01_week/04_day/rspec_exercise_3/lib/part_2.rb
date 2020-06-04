def element_count(arr)
    hash = Hash.new(0)
    arr.each { |ele| hash[ele] += 1 }
    hash 
end 

def char_replace!(str, hash)
  (0...str.length).each do |i|
    if hash.has_key?(str[i])
      str[i] = hash[str[i]]
    end
  end
  str
end

def product_inject(arr)
    arr.inject { |acc, ele| acc * ele }
end 