###############################
##### Mersenne Prime
def mersenne_prime(num)
  x = 0
  counter = 0
  while counter < num
    counter += 1 if prime?(2**x - 1)
    x += 1
  end
  2**(x-1) - 1
end

def prime?(n)
  return false if n < 2
  (2...n).none?{|i| n % i == 0}
end

##############################
##### Triangular word
def triangular_word?(str)
  alpha = [0] + ("a".."z").to_a

  str_sum = str.split("").map{|c| alpha.index(c)}.sum * 2
  return triangular?(str_sum)
end

def triangular?(sum)
  i = 0
  i += 1 while i*(i + 1) < sum
  i*(i + 1) == sum
end

################################
##### Consecutive Collapse
def consecutive_collapse(arr)
   arr.each{arr = collapse(arr)}
   arr
end
# def collapse(nums)
#     (0...nums.length - 1).each do |i|
#         if nums[i] + 1 == nums[i + 1] || nums[i] == nums[i + 1] + 1
#             return nums[0...i] + nums[i + 2..-1]
#         end
#     end

#     nums
# end
def collapse(arr)
  (0...arr.length - 1).each do |i|
    if arr[i] == arr[i+1] + 1 || arr[i] + 1 == arr[i + 1]
      return arr[0...i] + [i + 2..-1]
    end
  end
  arr
end

################################
##### Pretentious Primes

# def pretentious_primes(arr, steps)
#   arr.map do |num|
#     temp = num
#     if steps > 0
#       steps.times do
#         temp += 1
#         while !is_prime?(temp)
#           temp += 1
#         end
#       end
#     else
#       rev_steps = -steps
#       rev_steps.times do
#         temp -= 1
#         while !is_prime?(temp)
#           temp -= 1
#           break if temp < 2
#         end
#       end
#     end
#     if temp < 2
#       nil
#     else
#       temp
#     end
#   end
# end

def next_prime(num, steps)
  i = 1

  # reverses the steps if negative
  if steps < 0
    i = -(i)
    steps = -(steps)
  end

  counter = 0
  while counter < steps
    # checks for going to -ve #s
    return nil if num < 2
    num += i
    counter += 1 if prime?(num)
  end
  num
end

def pretentious_primes(arr, steps)
  arr.map { |ele| next_prime(ele, steps) }
end
