# def proper_factors(n)
#     (1...n).select { |i| n % i == 0 }
# end 

# def aliquot_sum(n)
#   proper_factors(n).sum
# end

# def perfect_number?(n) 
#     aliquot_sum(n) == n 
# end 

# def ideal_numbers(n)
#   new_array = []
#   i = 1
#   while new_array.length < n 
#     new_array << i if perfect_number?(i)
#     i += 1
#   end
#   new_array
# end
def proper_factors(n)
  # res array
  # go through 1...n set to x
  #   if n % x == 0 dump into the res array, else skip
  # return res
  res = []
  (1...n).each do |x|
    res << x if n % x == 0
  end
  res
end

def aliquot_sum(n)
  arr = proper_factors(n) # has my array
  arr.sum
end

def perfect_number?(n)
  aq_sum = aliquot_sum(n)
  n == aq_sum
end

def ideal_numbers(n)
  res = []
  i = 1
  while res.length < n
    res << i if perfect_number?(i)
    i += 1
  end
  res
end