# frozen_string_literal: true

require_relative '../lib/enumerables'

class MyList < MyEnumerable
  def initialize(*myarr)
    @list = myarr
  end

  def each
    i = 0
    while i < @list.length
      yield @list[i]
      i += 1
    end
  end
end

list = MyList.new(1, 2, 3, 4)
puts(list.all? { |e| e > 5 })
# => #<MyList: @list=[1, 2, 3, 4]>
# # Test #all?
# irb> list.all? {|e| e < 5}
# => true
# irb> list.all? {|e| e > 5}
# => false

# # Test #any?
# irb> list.any? {|e| e == 2}
# => true
# irb> list.any? {|e| e == 5}
# => false

# # Test #filter
# irb> list.filter {|e| e.even?}
# => [2, 4]
