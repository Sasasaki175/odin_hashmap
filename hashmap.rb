# raise IndexError if index.negative? || index >= @buckets.length

require_relative 'linked_lists'

class HashMap
  def initialize
    @load_factor = 0.75
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end

  def set(key, value)
    bucket_index = hash(key) % @capacity

    if @buckets[bucket_index] == nil
      @buckets[bucket_index] = LinkedList.new
      @buckets[bucket_index].append([key, value])
    elsif @buckets[bucket_index].values.none? { |value| value[0] == key }
      @buckets[bucket_index].append([key, value])
    else
      same_key_index = @buckets[bucket_index].values.index { |value| value[0] == key }
      @buckets[bucket_index].remove_at(same_key_index)
      @buckets[bucket_index].insert_at([key, value], same_key_index)
    end

    grow_buckets_size if length > @capacity * @load_factor
  end

  def get(key)
    @buckets.compact.each do |bucket|
      bucket.values.each do |value|
        return value[1] if value[0] == key
      end
    end
  end

  def has?(key)
    @buckets.compact.each do |bucket|
      return bucket.values.any? { |value| value[0] == key }
    end
  end

  def remove(key)
    @buckets.compact.each do |bucket|
      key_index = bucket.values.index { |value| value[0] == key }
      bucket.remove_at(key_index) if key_index
    end
  end

  def length
    length = 0

    @buckets.compact.each do |bucket|
      length += bucket.size
    end

    length
  end

  def clear
    @capacity = 16
    @buckets = Array.new(@capacity)
  end

  def keys
    keys = []

    @buckets.compact.each do |bucket|
      bucket.values.each do |value|
        keys << value[0]
      end
    end

    keys
  end

  def values
    values = []

    @buckets.compact.each do |bucket|
      bucket.values.each do |value|
        keys << value[1]
      end
    end

    values
  end

  def entries
    entries = []
    
    @buckets.compact.each do |bucket|
      entries += bucket.values
    end
    
    entries
  end

  private

  def grow_buckets_size
    temp_buckets = @buckets.dup
    @capacity *= 2
    @buckets = Array.new(@capacity)

    temp_buckets.compact.each do |bucket|
      bucket.values.each do |value|
        set(value[0], value[1])
      end
    end
  end
end
