class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value,parent=nil)
    @value = value
    @parent = parent
    @left = nil
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end
  # Takes a sorted array of data and turns it into a binary tree full of Node
  # objects appropriately placed.
  def build_tree_sorted(array,parent=nil)
    root_value = array[array.length/2]
    left_values = array[0..array.length/2-1]
    right_values = array[array.length/2+1..-1]

    # Creates a Node object with the root value and assign the parent Node if
    # there is one.
    root = Node.new(root_value,parent)
    @root = root if @root == nil

    # If there's only one value left in the left array, creates a Node object
    # with it. Else, calls build_tree recursively.
    if left_values.size == 1
      root.left = Node.new(left_values[0],root)
    elsif left_values.size > 1
      root.left = build_tree(left_values,root)
    end

    # Does the same as before with the right side.
    if right_values.size == 1
      root.right = Node.new(right_values[0],root)
    elsif right_values.size > 1
      root.right = build_tree(right_values,root)
    end

    return root
  end

  # Takes an unsorted array of data and turns it into a binary tree full of Node
  # objects appropriately placed.
  def build_tree_unsorted(array)
    array
  end

  def add_node(node)

  end
end

p build_tree_sorted([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11])
