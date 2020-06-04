def proper_factors(n)
    (1...n).select { |i| n % i == 0 }
end 

def aliquot_sum(n)
  proper_factors(n).sum
end

def perfect_number?(n) 
    aliquot_sum(n) == n 
end 

def ideal_numbers(n)
  new_array = []
  i = 1
  while new_array.length < n 
    new_array << i if perfect_number?(i)
    i += 1
  end
  new_array
end