# def is_prime?(n)
#   return false if n < 2
#   (2...n).none? {|factor| n % factor == 0}
# end

# def nth_prime(n) 
#     count = 0 
#     i = 0
#     while count < n 
#         count += 1 if is_prime?(i)

#         i += 1
#     end 
#     return i - 1
# end 

# def prime_range(min, max)
#   new_array = []
#   (min..max).each do |i|
#     new_array << i if is_prime?(i)
#   end
#   new_array
# end

def is_prime?(n)
  return false if n < 2
   (2...n).none? {|i| n % i == 0}
end 

def nth_prime(n)
  nth_prime = 0
  count = 0
  while count < n 
    nth_prime += 1
    count += 1 if is_prime?(nth_prime)
  end
  nth_prime
end

def prime_range(min, max)
  res = []
  (min..max).each {|i| res << i if is_prime?(i)}
  res
end