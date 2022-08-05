class Node
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add(other_value)
    if other_value < value
      left.nil? ? @left = Node.new(other_value) : left.add(other_value)
    elsif other_value > value
      right.nil? ? @right = Node.new(other_value) : right.add(other_value)
    else
      nil
    end
  end

  def delete(node = self, value)
    if node == nil
      return node
    end
    if value < node.value
      node.left = delete(node.left, value)
    elsif value > node.value
      node.right = delete(node.right, value)
    elsif node.left != nil && node.right != nil
      node.value = get_minimum(node.right).value
      node.right = delete(node.right, node.value)
    else
      if node.left != nil
        node = node.left
      elsif node.right != nil
        node = node.right
      else
        node = nil
      end
    end
    node
  end

  def get_minimum(node=self)
    return if node.nil?
    return node if node.left.nil?

    get_minimum(node.left)
  end

  def find(node = self, value)
    return nil if node.nil?
    if value < node.value
      find(node.left, value)
    elsif value > node.value
      find(node.right, value)
    else
      value
    end
  end

  public attr_accessor :value, :left, :right
end
