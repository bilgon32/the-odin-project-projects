class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value,parent=nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
    puts "value: #{@value} parent: #{@parent.value} self: #{self}" if @parent != nil
  end
end

class BinaryTree
  attr_accessor :root, :queue, :stack

  def initialize
    @root = nil
    @queue = []
    @stack = []
  end
  # Takes a sorted array of data and turns it into a binary tree full of Node
  # objects appropriately placed.
  def build_tree(array,parent=nil)
    root_value = array[array.length/2]
    left_values = array[0..array.length/2-1]
    right_values = array[array.length/2+1..-1]

    # Creates a Node object with the root value and assign the parent Node if
    # there is one.
    root = Node.new(root_value,parent)
    @root = root if @root == nil

    # If there's only one value left in the left array, creates a Node object
    # with it. Else, calls build_tree recursively.
    if left_values.length == 1
      root.left = Node.new(left_values[0],root)
    elsif left_values.length > 1
      root.left = build_tree(left_values,root)
    end

    # Does the same as before with the right side.
    if right_values.length == 1
      root.right = Node.new(right_values[0],root)
    elsif right_values.length > 1
      root.right = build_tree(right_values,root)
    end

    return root
  end

  # Takes an unsorted array of data and turns it into a binary tree full of Node
  # objects appropriately placed.
  def build_tree_unsorted(array)
    # Since we can't sort the array, there's no way to know what's the
    # median of the values. So we're gonna choose a random input for the root.
    @root = Node.new(array[array.length/2])
    array.delete_at(array.length/2)
    # Calls the method to add each value to the binary tree. We're gonna let
    # the method decide where to put it.
    array.each do |value|
      add_node(value)
    end
    return @root
  end

  # Finds a place to put the value and creates a Node there.
  def add_node(value,parent=@root)
    if value <= parent.value
      if parent.left == nil
        print "left - "
        parent.left = Node.new(value,parent)
      else
        add_node(value,parent.left)
      end
    else
      if parent.right == nil
        print "right - "
        parent.right = Node.new(value,parent)
      else
        add_node(value,parent.right)
      end
    end
  end

  def breadth_first_search(parameter)
    @queue.push(@root)

    @queue.each do |node|
      return node if node.value == parameter
      @queue.push(node.left) if node.left != nil
      @queue.push(node.right) if node.right != nil
    end
    return nil
  end

  # We'll use @queue to queue the nodes to the left and @stack to stack
  # the nodes to the right. It will go to the @stack only when there's
  # nothing in the @queue
  def depth_first_search(parameter)
    @queue.push(@root)

    until @queue.empty? && @stack.empty?
      until @queue.empty?
        node = @queue.shift
        return node if node.value == parameter
        @queue.push(node.left) if node.left != nil
        @stack.push(node.right) if node.right != nil
      end
      node = @stack.pop
      return node if node.value == parameter
      @queue.push(node.left) if node.left != nil
      @stack.push(node.right) if node.right != nil
    end
    return nil
  end

  def dfs_rec(parameter,node=@root)
    return node if node.value == parameter
    left = dfs_rec(parameter,node.left) if node.left != nil
    return left if left != nil
    right = dfs_rec(parameter,node.right) if node.right != nil
    return right if right != nil
    return nil
  end
end

tree1 = BinaryTree.new
tree2 = BinaryTree.new

# tree1.build_tree([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
tree2.build_tree_unsorted([1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324])
p tree2.depth_first_search(4)
p tree2.dfs_rec(4)
