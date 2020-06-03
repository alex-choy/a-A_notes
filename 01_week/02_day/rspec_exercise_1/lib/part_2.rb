# def hipsterfy(str)
#   vowels = "aeiou"  
#     idx = str.length -1
#     while idx>=0
#       puts idx
#       if vowel.include?(str[idx])
#         return str[0..idx]+str[idx+1..str.length]
#       end
#       idx -=1
#     end
#     str
# end

def hipsterfy(str)
  vowels = "aeiou"
  idx = str.length - 1

  while idx >= 0
    if vowels.include?(str[idx])
      str[idx] = ""
      return str
    end
    idx -= 1
  end
  str
end

def vowel_counts(str)
  hm = Hash.new(0)
  vowels = "aeiou"

  str.downcase.each_char do |ele|
    if vowels.include?(ele)
      hm[ele] += 1
    end
  end
  hm
end

def caesar_cipher(sentence, num)
  alpha = "abcdefghijklmnopqrstuvwxyz"
  result = ""
  sentence.each_char.with_index do |ele, i|
    if alpha.include?(ele)
      curr_idx = alpha.index(ele)
      result += alpha[(curr_idx + num) % 26]
    else
      result += ele
    end
  end

  result
end