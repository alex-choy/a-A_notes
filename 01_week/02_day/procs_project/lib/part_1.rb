def my_map(arr, &proc)
  arr.each_with_index do |ele, i|
    arr[i] = proc.call(ele)
  end
  arr
end

def my_select(arr, &proc)
  result = []
  arr.each do |ele|
    result << ele if proc.call(ele)
  end

  result
end

def my_count(arr, &proc)
  count = 0
  arr.each do |ele|
    count += 1 if proc.call(ele)
  end
  count
end

def my_any?(arr, &proc)
  arr.each do |ele|
    return true if proc.call(ele)
  end
  false
end

def my_all?(arr, &proc)
  arr.each do |ele|
    return false if !proc.call(ele)
  end
  true
end

def my_none?(arr, &proc)
  arr.each do |ele|
    return false if proc.call(ele)
  end 
  true
end