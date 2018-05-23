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

  a = [1, 2, 3]
p a.my_select { |num| num > 1 } # => [2, 3]
p a.my_select { |num| num == 4 } # => []
end
