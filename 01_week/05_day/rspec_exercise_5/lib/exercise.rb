def zip(*arrs)
  zipped = Array.new(arrs[0].length){Array.new}
  arrs.each do |arr|
    arr.each_with_index do |ele, i|
      zipped[i] << ele 
    end
  end
  zipped
end 

def prizz_proc(arr, prc1, prc2)
  arr.select { |ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele)) }
end

def zany_zip(*arrs)
  length = 0
  arrs.each do |arr|
    length = arr.length if length < arr.length
  end
  zipped = Array.new(length){Array.new}
  arrs.each do |arr|
    i = 0
    arr.each do |ele|
      zipped[i] << ele 
      i += 1
    end
    while i < length
      zipped[i] << nil
      i += 1
    end
  end
  zipped
end

def maximum(arr, &prc)
  max = arr[0]
  arr.each {|ele| max = ele if prc.call(ele) >= prc.call(max)}
  max
end

def my_group_by(arr, &prc)
  hash = Hash.new{|h, k| hash[k] = Array.new}
  arr.each do |ele|
    hash[prc.call(ele)] << ele 
  end
  hash
end

def max_tie_breaker(arr, prc1, &prc2)
  if arr.empty? 
    return nil
  end 
  max = arr[0]
  arr.each do |ele|
    if prc2.call(ele) > prc2.call(max)
      max = ele
    elsif prc2.call(ele) == prc2.call(max)
      if prc1.call(ele) > prc1.call(max)
        max = ele
      end
    end
  end 
  max
end

def silly_syllables(sent)
  vowels = "aeiou"
  words = sent.split(" ")
  words.each_with_index do |word, i|
    v_indices = []
    word.each_char.with_index { |char, j| v_indices << j if vowels.include?(char) }
    if v_indices.length >= 2
      left_i = v_indices[0]
      right_i = v_indices[-1]
      words[i] = word[left_i..right_i]
    end
  end
  words.join(" ")
end

# p silly_syllables("test out this crazy sentence")