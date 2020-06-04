################################
##### anti_prime?
def anti_prime?(num)
  # max_divisors = 1
  # check each num from 1..n-1 for max div
  # (1...num).each do |curr_n|
  #   curr_divs = get_num_divs(curr_n / 2)
  #   max_divisors = curr_divs if curr_divs > max_divisors
  # end

  # compare num divs vs max_divs
  comp_divs = get_num_divs(num)
  (1...num).all? { |n| get_num_divs(n) < comp_divs }
end

def get_num_divs(curr_n)
  # curr_divs = 1
  (1..curr_n).count { |i| curr_n % i == 0 }
  # curr_divs
end

################################
##### matrix_addition
def matrix_addition(m1, m2)
  height = m1.length
  width = m1[0].length
  res = Array.new(height) {Array.new(width, 0)}
  height.times do |i|
    width.times do |j|
      res[i][j] = m1[i][j] + m2[i][j]
    end
  end
  res
end

################################
##### mutual_factors
def mutual_factors(*nums)
  res = []
  smallest_n = nums.min

  (1..smallest_n).each do |i|
    res << i if nums.all? { |num| num % i == 0 }
  end
  res
end

###############################
##### tribonacci_number
def tribonacci_number(num)
  return 0 if num < 1
  memo = [1, 1, 2]
  return memo[num - 1] if num < 4
  while memo.size < num
    memo << memo[-3] + memo[-2] + memo[-1]
  end
  return memo[-1]
end
