def strange_sums(arr)
  arr.count { |ele| arr.include?(-ele) } / 2
end

def pair_product(arr, num)
  arr.each_with_index do |ele1, i|
    ele2 = num.to_f / ele1
    return true if arr.include?(ele2) && arr.index(ele2) != i
  end
  false
end

def rampant_repeats(str, hash)
  arr = str.split("")

  arr.map! do |char|
    if hash.has_key?(char)
      char * hash[char]
    else
      char
    end
  end
  arr.join("")
end

def perfect_square(num)
  (1..num).any? { |i| i * i == num }
end
