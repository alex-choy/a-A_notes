# def palindrome?(str)
#   l, r = 0, str.length - 1
#   while l < r
#     return false if str[l] != str[r]
#     l += 1
#     r -= 1
#   end
#   true
# end

# def substrings(str)
#   res = []
#   str.each_char.with_index do |char, i|
#     curr_str = char
#     res << char
#     (i + 1...str.length).each do |char2|
#       curr_str += str[char2]
#       res << curr_str
#     end
#   end
#   res
# end

# def palindrome_substrings(str)
#   substrings(str).select { |s| palindrome?(s) && s.length > 1 }
# end


def palindrome?(str)
  l, r = 0, str.length - 1 
  while l < r 
    return false if str[l] != str[r]
    l += 1 
    r -= 1
  end
  true
end

def substrings(str)
  res = []

  str.each_char.with_index do |char, i|
    (i...str.length).each do |j|
      res << str[i..j]
    end
  end
  res
end

def palindrome_substrings(str)
  substrings(str).select{|ele| palindrome?(ele) && ele.length > 1}
end