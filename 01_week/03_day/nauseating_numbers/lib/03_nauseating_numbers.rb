require_relative "02_nauseating_numbers"
##############################
##### Matrix Addition Reloaded
# def matrix_addition_reloaded(*matricies)
#   return nil if !right_matrix_size?(matricies)
#   res = []
#   m_col_len = matricies[0].length
#   m_row_len = matricies[0][0].length

# done in this order to go through every col and row
# then we grab the same m[i][j] from each matrix to put into res_row at once
#   m_col_len.times do |i| # get the current col
#     res_row = []
#     m_row_len.times do |j| # get the current row
#       curr_sum = 0
#       matricies.length.times do |matrix_idx| # get each matrix to sum
#         curr_sum += matricies[matrix_idx][i][j]
#       end
#       res_row << curr_sum
#     end
#     res << res_row
#   end
#   res
# end

# def right_matrix_size?(matricies)
#   return true if matricies.length == 1
#   # check col lengths of each matrix
#   (1...matricies.length).each do |i|
#     return false if matricies[0].length != matricies[i].length
#   end

#   # check each row lengths of each matrix
#   m1 = matricies[0]
#   (1...matricies.length).each do |curr_m_idx|
#     curr_m = matricies[curr_m_idx]
#     m1.each_with_index do |m1_row, i|
#       curr_m_row_len = curr_m[i].length
#       return false if curr_m_row_len != m1_row.length
#     end
#   end
#   true
# end

def matrix_addition_reloaded(*matrices)
  first_m = matrices.first
  height = first_m.length
  width = first_m[0].length
  res = Array.new(height) {Array.new(width, 0)}
  
  matrices.inject(res) do |m1, m2|
    return nil if m1.length != m2.length || m1[0].length != m2[0].length
    matrix_addition(m1, m2)
  end
end

###############
##### Squarocol
def squarocol?(arr)
  height = arr[0].length

  height.times do |i|
    row, col = [], []
    height.times do |j|
      row << arr[i][j]
      col << arr[j][i]
    end
    return true if row.all?{|ele| ele == arr[i][i]} ||
      col.all?{|ele| ele == arr[i][i]}
  end
  false
end

##############################
##### Squaragonal

def squaragonal?(arr)
  height, width = arr.length, arr.length
  tl, tr = [], []
  height.times do |i|
    tl << arr[i][i]
    tr << arr[i][-1 - i]
  end

  tl.all?{|e| e == arr[0][0]} || tr.all?{|e| e == arr[0][-1]}
end


#############################
##### Pascal's Triangle
def pascals_triangle(num)
  triangle = [[1]]
  return triangle if num == 1

  while triangle.length < num
    prev_row = triangle.last
    new_row = [1]
    (0...prev_row.length - 1).each do |j|
      new_row << prev_row[j] + prev_row[j + 1]
    end
    new_row << 1
    triangle << new_row
  end
  triangle
end
