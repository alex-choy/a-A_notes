# def partition(arr, num)
#   less_a = arr.select { |ele| ele < num }
#   more_a = arr.select { |ele| ele >= num }
#   [less_a, more_a]
# end

# def merge(hash1, hash2)
#   res_hash = hash1.clone
#   hash2.each do |k, v|
#     res_hash[k] = v
#   end
#   res_hash
# end

# def censor(str, arr)
#   vowels = "aeiouAEIOU"
#   split_str = str.split(" ")

#   split_str.each_with_index do |word, i|
#     if arr.include?(word.downcase)
#       word.each_char.with_index do |char, i|
#         if vowels.include?(char)
#           word[i] = "*"
#         end
#       end
#     end
#   end
#   split_str.join(" ")
# end

# def power_of_two?(num)
#   i = 0
#   while 2 ** i <= num
#     return true if 2 ** i == num
#     i += 1
#   end
#   false
# end

def partition(arr, n)
  return [arr.select{|ele| ele < n}, arr.select{|ele| ele >= n}]
end

def merge(h1, h2)
   hash = {}
   h1.each {|k, v| hash[k] = v}
   h2.each {|k, v| hash[k] = v}
   hash
end

def censor(sent, arr)
  words = sent.split
  vowels = 'aeiouAEIOU'
  words.map! do |word|
    if arr.include?(word.downcase)
      word.each_char.with_index do |char, i|
        word[i] = '*' if vowels.include?(char)
      end
      word
    else
      word
    end
  end

  words.join(" ")
end

def power_of_two?(num)
  exp = 0
  exp += 1 while 2 ** exp < num
  num == 2 ** exp
end