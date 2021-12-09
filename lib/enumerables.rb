# frozen_string_literal: true

class MyEnumerable
  def filter
    return enum_for(:my_filter) unless block_given?

    new_self = *self

    new_arr = []
    new_hash = {}
    if instance_of?(Hash)
      j = 0
      while j < length
        new_hash[keys[j]] = values[j] if yield(keys[j], values[j])
        j += 1
      end
      new_hash
    elsif new_self.instance_of?(Array)
      i = 0
      while i < new_self.length
        new_arr << new_self[i] if yield new_self[i]
        i += 1
      end
      new_arr
    end
  end
end
