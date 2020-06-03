def reverser(str, &proc)
  proc.call(str.reverse)
end

def word_changer(str, &proc)
  arr = str.split(" ")
  arr.map!{|ele| proc.call(ele)}
  arr.join(" ")
end

def greater_proc_value(num, proc1, proc2)
  res1 = proc1.call(num)
  res2 = proc2.call(num)

  return res2 if res2 > res1
  res1
end 

def and_selector(arr, proc1, proc2)
  arr.select!{|ele| proc1.call(ele)}
  arr.select!{|ele| proc2.call(ele)}
  arr
end

def alternating_mapper(arr, proc1, proc2)
  result = []
  arr.each_with_index do |ele, i|
    result << proc1.call(ele) if i.even?
    result << proc2.call(ele) if i.odd?
  end
  result
end