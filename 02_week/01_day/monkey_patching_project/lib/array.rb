# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.sum / self.length.to_f
  end

  def median 
    return nil if self.length == 0
    new_self = self.sort
    if new_self.length.odd?
      return new_self[new_self.length / 2]
    elsif new_self.length.even?
      return (new_self[new_self.length/2] + new_self[new_self.length/2-1])/2.to_f
    end
  end

  def counts
    hash = Hash.new(0)
    self.each { |ele| hash[ele] += 1 }
    hash
  end 

  def my_count(char)
    self.counts[char]
  end 

  def my_index(char)
    return nil if !self.include?(char)
    self.each_with_index { |ele, i| return i if ele == char }
  end 

  def my_uniq
    results = [] 
    self.each { |ele| results << ele if !results.include?(ele) }
    results 
  end 

  def my_transpose
    results = Array.new(self.length) {Array.new(self.length)}
    self.each_with_index do |arr, i|
        arr.each_with_index do |ele, j|
            results[j][i] = ele
        end 
    end 
    results
  end 


end
