def selected_map!(arr, prc1, prc2)
  arr.map! do |ele|
    ele = prc2.call(ele) if prc1.call(ele)
    ele
  end
  nil
end

def chain_map(n, arr)
    arr.each { |prc| n = prc.call(n)}
    return n 
end 

def proc_suffix(sent, hash)
  words = sent.split
  words.map! do |word|
    new_word = word.clone
    hash.each do |prc, v|
      new_word += v if prc.call(word)
    end
    new_word
  end
  words.join(" ")
end

def proctition_platinum(arr, *procs)
    hash = {}
    procs.each_with_index do |prc, i| 
        temp_arr = []
        arr.each do |ele| 
            temp_arr << ele if prc.call(ele) 
        end 
        temp_arr.each {|ele| arr.delete(ele)}
        hash[i + 1] = temp_arr
    end 
    hash 
end 


def procipher(sent, hash)
  words = sent.split
  words.map! do |word|
    new_word = word.clone
    hash.each do |k, v|
      new_word = v.call(new_word) if k.call(word)
    end
    new_word
  end
  words.join(" ")
end

def picky_procipher(sent, hash)
  words = sent.split
  words.map! do |word|
    new_word = word.clone
    hash.each do |k, v|
        if k.call(word)
            new_word = v.call(new_word)
            break 
        end 
    end
    new_word
  end
  words.join(" ")
end


# def matrix_addition_reloaded(*mats)
# return nil if mats.any? { |mat| mats[0].length != mat.length || mats[0][0].length != mat[0].length }
    
#     mats.inject { |acc, mat| matrix_addition(acc, mat) }

# end 