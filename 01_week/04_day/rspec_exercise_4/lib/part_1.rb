# def my_reject(arr, &prc)
#   new_array = []
#   arr.each { |ele| new_array << ele if !prc.call(ele) }
#   new_array
# end

# def my_one?(arr, &prc) 
#     res = []
#     arr.each do |ele| 
#       res << ele  if prc.call(ele) 
#     end 
#     res.length == 1 
# end 

# def hash_select(hash, &prc)
#   new_hash = {}
#   hash.each do |k, v|
#     new_hash[k] = v if prc.call(k, v)
#   end
#   new_hash
# end

# def xor_select(arr, prc1, prc2)
#     arr.select { |ele| ele if (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))  }

# end 

# def proc_count(val, arr)
#   arr.count {|prc| prc.call(val)}
# end


def my_reject(arr, &prc)
  arr.select {|ele| !prc.call(ele)}
end

def my_one?(arr, &prc)
  count = arr.count {|ele| prc.call(ele)}
  count == 1
end

def hash_select(h, &prc)
  res_hash = {}
  h.each do |k, v|
    res_hash[k] = v if prc.call(k, v)
  end
  res_hash
end

def xor_select(arr, prc1, prc2)
  arr.select {|ele| (prc1.call(ele) && !prc2.call(ele)) || (!prc1.call(ele) && prc2.call(ele))}
end

def proc_count(val, procs)
  procs.count {|prc| prc.call(val)}
end