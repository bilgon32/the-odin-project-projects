class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @tail != nil
      @tail.next_node = node
    else
      @head = node
    end
    @tail = node
  end

  def prepend(node)
    node.next_node = @head if @head != nil
    @tail = node if @tail == nil
    @head = node
  end

  def size
    counter = 0
    return 0 if @head == nil
    node = @head
    while node != nil do
      counter += 1
      node = node.next_node
    end
    return counter
  end

  def at(index)
    counter = 1
    return "List is empty" if @head == nil
    return "Not found" if index > self.size
    node = @head
    while counter < index do
      counter += 1
      node = node.next_node
    end
    return node
  end

  def pop
    return "List is empty" if @head == nil
    if self.size == 1
      @head = nil
      @tail = nil
      return
    end
    @tail = at(self.size-1)
    @tail.next_node = nil
  end

  def contains?(value)
    counter = 1
    return false if @head == nil
    node = @head
    while counter <= self.size do
      return true if node.value == value
      counter += 1
      node = node.next_node
    end
    return false
  end

  def find(value)
    counter = 1
    return false if @head == nil
    node = @head
    while counter <= self.size do
      return counter if node.value == value
      counter += 1
      node = node.next_node
    end
    return nil
  end

  def to_s
    counter = 1
    return false if @head == nil
    node = @head
    while counter <= self.size do
      print "( #{node.value} ) -> "
      counter += 1
      node = node.next_node
    end
    print "nil"
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value = value
    @next_node = nil
  end
end
