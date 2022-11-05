module Enumerable
  # Your code goes here
  def my_each_with_index
    self.length.times { |i| yield self[i], i }
    return self
  end

  def my_select
    selected = []
    self.length.times { |i| selected.push(self[i]) if yield self[i]}
    selected
  end

  
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times { |e| yield self[e] }
    return self
  end
end
