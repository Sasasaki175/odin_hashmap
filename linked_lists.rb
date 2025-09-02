class LinkedList
  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    append_node = Node.new(value)
    @head = append_node if head == nil
    @tail.next_node = append_node unless @tail == nil
    @tail = append_node
  end

  def prepend(value)
    prepend_node = Node.new(value, head)
    prepend_node.next_node = @head unless @head == nil
    @head = prepend_node
    @tail = prepend_node if @tail == nil
  end

  def size
    size = 0
    node = @head

    while node
      node = node.next_node
      size += 1
    end

    return size
  end

  def head
    @head
  end

  def tail
    @tail
  end

  def at(index)
    node = @head
    i = 0
    
    if index < size
      while i < index
        node = node.next_node
        i += 1
      end
    else
      return 'Invalid index'
    end

    return node.value
  end

  def pop
    node = @head

    while node.next_node
      previous_node = node
      node = node.next_node
    end

    previous_node.next_node = nil
  end

  def contains?(value)
    node = @head

    while node.value
      return true if node.value == value
      node = node.next_node
    end
    
    return false
  end

  def find(value)
    index = 0
    node = @head

    while node
      return index if node.value == value
      node = node.next_node
      index += 1
    end

    return nil
  end

  def to_s
    node = @head
    string = ''

    loop do
      string += "( #{node.value} ) -> "
      string += 'nil' if node.next_node == nil
      break if node.next_node == nil
      node = node.next_node
    end

    return string
  end

  def insert_at(value, index)
    node = @head
    i = 0
    
    return puts 'Invalid index' unless (index < size)
    
    if index == 0
      @head = Node.new(value, @head)
    else
      while i < index
        previous_node = node
        node = node.next_node
        i += 1
      end

      previous_node.next_node = Node.new(value, node) unless previous_node == nil
    end
  end

  def remove_at(index)
    node = @head
    i = 0

    while i < index
      previous_node = node
      node = node.next_node
      i += 1
    end

    if index == 0
      @head = node.next_node
    else
      previous_node.next_node = node.next_node
    end
  end

  def values
    node = @head
    values = []

    while node
      values << node.value
      node = node.next_node
    end

    values
  end
end

class Node
  attr_accessor :value, :next_node
  
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end