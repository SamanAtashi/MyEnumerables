# frozen_string_literal: true

# rubocop:disable Style/Documentation

require_relative '../lib/enumerables'

class MyList < MyEnumerable
  def initialize(*myarr)
    super()
    @list = myarr
  end
  # this is our classs

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
# rubocop:enable Style/Documentation
