def select_even_nums(arr)
  arr.select{|num| num.even?}
end

def reject_puppies(arr)
  arr.reject{|hash| hash["age"] <= 2}
end 

def count_positive_subarrays(arr)
  arr.count{|sub_arr| sub_arr.sum > 0}
end

def aba_translate(str)
  vowels = "aeiou"
  arr = str.split("")

  arr.map! do |char| 
    if vowels.include?(char)  
      char + "b" + char
    else 
      char
    end
  end
  arr.join
end

def aba_array(arr)
  arr.map{|str| aba_translate(str)}
end