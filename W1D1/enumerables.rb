#my each
class Array

  def my_each(&prc)
    i = 0
    while i < self.length
      prc.call(self[i])
      i += 1
    end

    self
  end
  # return_value = [1, 2, 3].my_each do |num|
  #   puts num
  # end.my_each do |num|
  #   puts num
  # end
  # # => 1
  #      2
  #      3
  #      1
  #      2
  #      3
  #
  # p return_value  # => [1, 2, 3]



  def my_select(&prc)
    arr = []
    self.my_each do |select|
      arr << select if prc.call(select)
    end
    arr
  end
#
#   a = [1, 2, 3]
# p a.my_select { |num| num > 1 } # => [2, 3]
# p a.my_select { |num| num == 4 } # => []


  def my_any?(&prc)
    self.my_each do |num|
      return true if prc.call(num)
    end
    false
  end

  def my_all?(&prc)
    new_arr = []
    self.my_each do |num|
      new_arr << num if prc.call(num)
    end
      self == new_arr
  end


  a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true


  def my_flatten
    flattened = []
    self.my_each do |el|
      if el.is_a?(Array)
        flattened.concat(el.my_flatten)
      else
        flattened << el
      end
    end
    flattened
  end

p  [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten # => [1, 2, 3, 4, 5, 6, 7, 8]




end
