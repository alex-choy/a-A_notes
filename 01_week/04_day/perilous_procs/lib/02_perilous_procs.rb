def xnor_select(arr, prc1, prc2)
  arr.select {|ele| (prc1.call(ele) && prc2.call(ele)) || (!prc1.call(ele) && !prc2.call(ele))}
end

def filter_out!(arr, &prc)
    arr.select! { |ele| !prc.call(ele)}
end 

def multi_map(arr, n=1, &prc)
  new_array = []

  # n.times do 
  #   new_array = []
  #   arr.map do |ele|
  #     ele = prc.call(ele)
  #     new_array << ele
  #   end
  #   arr = new_array
  # end

  arr.each do |ele|
    n.times do 
      ele = prc.call(ele)
    end
    new_array << ele
  end
  new_array
end

def proctition(arr, &prc) 
    good = []
    bad = []
    arr.each do |ele|
        good << ele if prc.call(ele)
        bad << ele if !prc.call(ele)
    end 
    good + bad 
end 