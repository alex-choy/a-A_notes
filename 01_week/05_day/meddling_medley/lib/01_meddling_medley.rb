require "byebug"
def duos(str)
  count = 0
  (0...str.length - 1).each do |i|
    count += 1 if str[i] == str[i + 1]
  end
  count
end

def sentence_swap(sent, hash)
  words = sent.split
  words.each_with_index do |word, i|
    words[i] = hash[word] if hash.keys.include?(word)
  end 
  words.join(" ")
end

def hash_mapped(hash, prc1, &prc2)
  new_hash = {}
  hash.each do |k, v|
    new_hash[prc2.call(k)] = prc1.call(v)
  end
  new_hash
end

def counted_characters(str)
  hash = Hash.new(0)
  str.each_char do |char|
    hash[char] += 1
  end
  hash.keys.select{|k| hash[k] > 2}
end

def triplet_true(str)
  str.each_char.with_index do |char, i|
    count = 1
    count += 1 while char == str[i + count]
    return true if count >= 3
  end
  return false
end

def energetic_encoding(str, hash)
  chars = str.split("")
  chars.map! do |char|
    if hash.keys.include?(char)
      hash[char]
    elsif char == " "
      " "
    else
      "?"
    end
  end
  chars.join("")
end

def uncompress(str)
i = 0
result = ""
while i < str.length
  char = str[i]
  count = str[i + 1].to_i
  a = char * count
  result += a
  i += 2
end
result
end