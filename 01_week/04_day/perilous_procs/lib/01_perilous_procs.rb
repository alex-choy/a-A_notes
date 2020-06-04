def some?(arr, &prc)
    arr.each { |ele| return true if prc.call(ele)}
    false 
end 

def exactly?(arr, n, &prc)
  count = 0
  arr.each {|ele| count += 1 if prc.call(ele)}
  count == n
end

def filter_out(arr, &prc) 
    new_arr = []
    arr.each { |ele| new_arr << ele if !prc.call(ele)}
    new_arr 
end 


def at_least?(arr, n, &prc)
  count = 0
  arr.each {|ele| count += 1 if prc.call(ele)}
  count >= n
end

def every?(arr, &prc)
    arr.each { |ele| return false if !prc.call(ele)}
    true 
end 


def at_most?(arr, n, &prc)
  count = 0
  arr.each {|ele| count += 1 if prc.call(ele)}
  count <= n
end

def first_index(arr, &prc)
    arr.each_with_index { |ele, i| return i if prc.call(ele)}
    return nil 
end 