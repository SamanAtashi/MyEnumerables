# frozen_string_literal: true

class MyEnumerable
  def all?
    each { |num| return false unless yield num }
    true
  end

  def any?
    each { |num| return true if yield num }
    false
  end

  def filter
    newArr = []
    each { |num| newArr.push(num) if yield num }
    newArr
  end
end
