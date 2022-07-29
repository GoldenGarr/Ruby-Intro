=begin
Нужно реализовать класс BinaryTree, в котором можно будет хранить элементы Node.
У класса должны быть методы для добавления элемента в дерево, удаления и поиска элемента.
За тип данных можно принять Integer
=end

require_relative 'node'

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    iter = root

    if iter.nil?
      @root = Node.new(value)
    else
      @root.add(value)
      # root.add_recursive(value)
    end
  end

  def find(node = root, value)
    return nil if node.nil?
    if value < node.value
      find(node.left, value)
    elsif value > node.value
      find(node.right, value)
    else
      value
    end
  end

  def delete(node = root, value)
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

  private def get_minimum(node = root)
    return if node.nil?
    return node if node.left.nil?

    get_minimum(node.left)
  end

  def to_s
    centered_print(root)
  end

  # An ordered debug print
  private def centered_print(node = root)
    if node == nil
      p "empty"
    end
    unless node.left.nil?
      centered_print(node.left)
    end
    puts node.value.to_s
    unless node.right.nil?
      centered_print(node.right)
    end
  end
end

tree = BinaryTree.new

tree.add(10)
tree.add(20)
tree.add(30)
tree.add(40)
tree.add(34)
tree.add(5)

# p tree.get_minimum

# p tree.find(20)
# p tree.find(40)
# p tree.find(35) #...
# p tree.find(34)
# p tree.find(10)
# p tree.find(5)

p tree
puts "_____"

tree.delete(10)
tree.delete(20)
tree.delete(30)
tree.delete(5)


# tree.sub_delete(tree.root, 10)

p tree
# p tree.to_s
