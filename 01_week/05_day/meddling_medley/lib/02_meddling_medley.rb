def conjunct_select(arr, *procs)
  arr.select{ |ele| procs.all? {|prc| prc.call(ele) }}
  # new_arr.uniq
end

def convert_pig_latin(sent)
  vowels = 'aeiouAEIOU'
  words = sent.split
  words.map! do |word|
    if word.length >= 3
      if vowels.include?(word[0])
        word += 'yay'
      else 
        first_vow = 0
        first_vow += 1 while !vowels.include?(word[first_vow])
        # if capitalized
        if word[0] == word[0].upcase
          mid_part = word[first_vow+1..-1]
          last_part = word[0...first_vow].downcase
          word = word[first_vow].upcase + mid_part + last_part + 'ay'
        else # not caps
          word = word[first_vow..-1] + word[0...first_vow] + 'ay'
        end
      end
    else
      word 
    end
  end
  words.join(" ")
end


def reverberate(sent) 
  vowels = 'aeiouAEIOU'
  words = sent.split
  words.map! do |word|
    if word.length >= 3
      if vowels.include?(word[-1])
        word += word.downcase
      else
        last_vow = word.length - 1
        last_vow -= 1 while !vowels.include?(word[last_vow])
        word += word[last_vow..-1].downcase
      end
    else
      word
    end
  end
  words.join(" ")
end

def disjunct_select(arr, *procs)
  arr.select {|ele| procs.any?{|prc| prc.call(ele)}}
end


def alternating_vowel(sent)
  words = sent.split
  vowels = 'aeiouAEIOU'

  words.map.with_index do |word, i|
    idx = i.even? ? first_vow(word, vowels) : last_vow(word, vowels)
    idx == -1 ? word : word[idx] = ''
  end
  words.join(" ")
end

def first_vow(word, vowels)
  i = 0
  i += 1 while i < word.length && !vowels.include?(word[i])
  i == word.length ? i - 1 : i
end

def last_vow(word, vowels)
  i = word.length - 1
  i -= 1 while i >= 0 && !vowels.include?(word[i])
  i 
end


def silly_talk(sent)
  vowels = 'aeiouAEIOU'
  words = sent.split

  words.map! do |word|
    if vowels.include?(word[-1])
      word += word[-1]
    else
      word = aba_word(word, vowels)
    end
    word
  end
  words.join(" ")
end

def aba_word(word, vowels)
  chars = word.split('')
  chars.map! do |char|
    if vowels.include?(char)
      char = char + 'b' + char.downcase
    end
    char
  end
  chars.join
end


def compress(str)
  res = ''
  i = 0
  while i < str.length
    count = 1
    count += 1 while str[i] == str[i + count]
    res += str[i]
    res += count.to_s if count > 1

    i += count
  end

  res
end