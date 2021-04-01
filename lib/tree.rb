class TreeNode
  attr_reader :key, :value
  attr_accessor :left, :right

   def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
   end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: 
  # Space Complexity: 
  def add(key, value)
    new_node = TreeNode.new(key, value)
    
    if @root.nil?
      @root = new_node
    else
      add_helper(@root, new_node)
    end

  end

  def add_helper(current, new_node)
    return new_node if current.nil?

    if new_node.key >= current.key
      current.right = add_helper(current.right, new_node)
    elsif new_node.key <= current.key
      current.left = add_helper(current.left, new_node)
    end

    return current 
  end

  # Time Complexity: 
  # Space Complexity: 
  def find(key)
    if @root.nil?
      return nil
    else
      return find_helper(@root, key)
    end
  end

  def find_helper(current, key)
    return nil if current.nil?

    if key > current.key
      find_helper(current.right, key)
    elsif key < current.key
      find_helper(current.left, key)
    else
      return current.value
    end
  end

  # Time Complexity: 
  # Space Complexity: 
  def inorder
    return [] if @root.nil?
    return inorder_helper(@root, [])
  end

  def inorder_helper(current, values)
    return values if current.nil?

    inorder_helper(current.left, values)
    values.push({key: current.key, value: current.value})
    inorder_helper(current.right, values)

    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def preorder
    return [] if @root.nil?
    return preorder_helper(@root, [])
  end

  def preorder_helper(current, values)
    return values if current.nil?

    values.push({key: current.key, value: current.value})
    preorder_helper(current.left, values)
    preorder_helper(current.right, values)

    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def postorder
    return [] if @root.nil?
    return postorder_helper(@root, [])
  end

  def postorder_helper(current, values)
    return values if current.nil?

    postorder_helper(current.left, values)
    postorder_helper(current.right, values)
    values.push({key: current.key, value: current.value})

    return values
  end

  # Time Complexity: 
  # Space Complexity: 
  def height
    raise NotImplementedError
  end

  # Optional Method
  # Time Complexity: 
  # Space Complexity: 
  def bfs
    raise NotImplementedError
  end

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end
end
