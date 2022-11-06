module Enumerable
  # Your code goes here
  def my_each_with_index
    self.length.times { |i| yield self[i], i }
    return self
  end

  def my_select
    selected = []
    self.length.times { |i| selected.push(self[i]) if yield(self[i]) } 
    selected
  end

  def my_all?
    all = true
    self.my_each { |v| all = false unless yield(v)}
    all
  end

  def my_any?
    any = false
    self.my_each { |v| any = true if yield(v)}
    any
  end

  def my_none?
    none = true
    self.my_each { |v| none = false if yield(v) }
    none
  end

  def my_count
    count = 0
    self.my_each { |v| count += 1 if yield(v) } if block_given? 
    return count unless count == 0
    self.length
  end

  def my_map
    mapped = []
    self.my_each { |v| mapped.push(yield(v))}
    mapped
  end

  def my_inject(start_value = 0)
    reduced = start_value
    self.my_each { |v| reduced = yield(reduced, v) }
    reduced
  end
end



# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.length.times { |e| yield(self[e]) }
    return self
  end
end
