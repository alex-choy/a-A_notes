require "byebug"

def all_words_capitalized?(arr)
  arr.all? {|str| str == str.capitalize}  
end

# check that none of the urls are valid
# if all urls are false, it will return true
def no_valid_url?(urls)
  urls.none? {|url| is_valid_url?(url)}
end

# checks if a url is valid
# if it ends with a valid_url, return true
def is_valid_url?(url)
  valid_url = ['.com', '.net', '.io', '.org'] 

  valid_url.each do |ending|
    return true if url.end_with?(ending)
  end
  false
end

def any_passing_students?(students)
  students.any? do |student|
   (student[:grades].sum / student[:grades].length) >= 75
  end 
end
