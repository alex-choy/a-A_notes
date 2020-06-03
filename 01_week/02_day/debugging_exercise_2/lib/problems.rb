# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

require "byebug"

def largest_prime_factor(num)
    largePF= 1
    (2..num).each do |a|
        largePF=a if num%a == 0 && isPrime?(a)
    end
    return largePF
end

def isPrime?(num)
    return false if num<2

    (2...num).each do |ele|
        if num%ele==0
            return false
        end
    end 
    return true
end

def unique_chars?(str)
  hash = {}

  str.each_char do |ele|
    return false if hash.has_key?(ele)
    hash[ele] = 1
  end
  true
end

def dupe_indices(arr)
    hash = {}
    arr.each.with_index do |ele,idx|
      hash[ele] = [] if !hash.has_key?(ele)
      hash[ele] << idx
    end
    p hash
    #.select! means mutate the hash in memory.
    hash.select! do |k,v|
      v if v.length >= 2
    end
    return hash
 end


 def ana_array_helper(arr)
    hm = Hash.new(0)
    arr.each do |ele|
        hm[ele]+=1
    end
    return hm
 end

 def ana_array(arr1, arr2)
    hash = Hash.new(0)
    arr1.each do |ele|
        hash[ele] += 1
    end

    arr2.each do |ele|
        return false if !hash.has_key?(ele)
        hash[ele] -= 1
        hash.delete(ele) if hash[ele] == 0
    end

    hash.length == 0
 end