# frozen_string_literal: true

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity
# rubocop:disable Metrics/MethodLength

class MyEnumerable
  def all?(arg = nil)
    unless arg.nil?
      if arg.is_a? Class
        each do |item|
          return false unless item.is_a?(arg)
        end
      elsif arg.is_a? Regexp
        each { |item| return false unless item =~ arg }
      else
        each { |item| return false unless item == arg }
      end
      return true
    end
    unless block_given?
      each { |item| return false unless item }
      return true
    end
    result = false
    each do |item|
      result = yield(item)
      break if result == false
    end
    result
  end

  def filter
    return enum_for(:filter) unless block_given?

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

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/MethodLength
