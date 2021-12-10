# frozen_string_literal: true

require_relative '../lib/enumerables'

class MyList
  def initialize(*arr)
    @list = arr
    @enumerables_ins = MyEnumerable.new
  end

  def all?
    @enumerables_ins.all?(@list)
  end
end

list = MyList.new(1, 2, 3, 4)
p list
# => #<MyList: @list=[1, 2, 3, 4]>
p(list.all?(&:positive?))
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
