module Enumerable
  def my_each
    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
  end

  def my_each_with_index
    i = 0
    while i < length
      yield(i, self[i])
      i += 1
    end
  end

  def my_select
    result = []
    my_each { |element| result << element if yield(element) }
  end

  def my_all
    flag = true
    my_each { |element| flag &&= yield(element) }
    flag
  end

  def my_any
    flag = false
    my_each { |element| flag ||= yield(element) }
    flag
  end

  def my_none
    flag = false
    my_each { |element| flag ||= yield(element) }
    !flag
  end

  def my_count
    count = 0
    my_each { |element| count += 1 if yield(element) }
    count
  end

  def my_map(proc = nil)
    result = []
    my_each do |element|
      proc ? result << proc.call(element) : result << yield(element)
    end
    result
  end

  def my_inject(init_value)
    res = init_value || 0
    my_each { |element| res = yield(res, element) }
    res
  end
end
arr = [1, 2, 3, 4]
arr.my_each { |element| puts element }
arr.my_each_with_index { |index, element| puts "index: #{index} for #{element}" }
def multiply_els(arr)
  arr.my_inject(1) { |res, ele| res * ele }
end
puts multiply_els([2, 4, 5])
proc = proc do |element|
  element.upcase
end
puts ["hi", "hey"].my_map(proc)