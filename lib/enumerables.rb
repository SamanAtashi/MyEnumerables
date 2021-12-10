# frozen_string_literal: true

# rubocop:disable Style/Documentation
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
    new_arr = []
    each { |num| new_arr.push(num) if yield num }
    new_arr
  end
end
# rubocop:enable Style/Documentation
