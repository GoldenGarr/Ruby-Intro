=begin
Нужно реализовать класс BinaryTree, в котором можно будет хранить элементы Node.
У класса должны быть методы для добавления элемента в дерево, удаления и поиска элемента.
За тип данных можно принять Integer
=end

require_relative 'Node'

class BinaryTree
  attr_accessor :root

  def initialize
    @root = nil
  end

  def add(value)
    iter = root

    if iter == nil
      @root = Node.new(value)
    else
      root.add(value)
      # root.add_recursive(value)
    end
  end

  def find(value)
    iter = root
    return if iter.nil?

    while iter != nil && iter.value != value
      iter = iter.value < value ? iter.right : iter.left
    end
    iter != nil && iter.value == value ? iter.value : nil
  end

  def delete(value)
    sub_delete(root, value)
  end

  def sub_delete(node, value)
    if node == nil
      return node
    end
    if value < node.value
      node.left = sub_delete(node.left, value)
    elsif value > node.value
      node.right = sub_delete(node.right, value)
    elsif node.left != nil && node.right != nil
      node.value = get_minimum(node.right).value
      node.right = sub_delete(node.right, value)
    else
      if node.left != nil
        node.value = node.left.value
        node.right = node.left.right
        node.left = node.left.left
        # node = node.left
      elsif node.right != nil
        node.value = node.right.value
        node.left = node.right.left
        node.right = node.right.right
        # node = node.right
      else
        @node = nil
      end
    end
  end

  def get_minimum(node)
    if node.left == nil
      return node
    end
    get_minimum(node.left)
    # if node == nil
    #   return nil
    # elsif node.left == nil
    #   node
    # end
    # get_minimum(node.left)
  end


  def to_s
    centered_print(root)
  end

  # An ordered debug print
  def centered_print(node)
    if node == nil
      p "empty"
    end
    if node.left != nil
      centered_print(node.left)
    end
    puts node.value.to_s
    if node.right != nil
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

# p tree.find(20)
# p tree.find(40)
# p tree.find(35) #...
# p tree.find(34)
# p tree.find(10)

tree.delete(10)
tree.delete(20)

# tree.sub_delete(tree.root, 10)

tree.centered_print(tree.root)
# p tree.to_s
