# hi ^)
# Нужно реализовать класс BinaryTree, в котором можно будет хранить элементы Node.
# У класса должны быть методы для добавления элемента в дерево, удаления и поиска элемента.
# За тип данных можно принять Integer

# Тестовые варианты

# tree = BinaryTree.new

# tree.add(10) #=> 10
# tree.add(20) #=> 20
# tree.add(30) #=> 30

# tree.delete(10) #=> 10
# tree.delete(25) #=> nil

# tree.find(20) #=> 20
# tree.find(26) #=> nil

class Node
  def initialize(value, left = nil, right = nil)
    @value = value
    @left = left
    @right = right
  end

  def add(other_value)
    iter = self
    prev = nil

    while iter != nil
      prev = iter
      iter = iter.value < other_value ? iter.right : iter.left
    end

    if prev.value < other_value
      prev.right = Node.new(other_value)
    else
      prev.left = Node.new(other_value)
    end
  end

  # def add_recursive(other_value)
  #   if other_value < value
  #     left.nil? ? @left = Node.new(value) : left.add_recursive(other_value)
  #   elsif other_value > value
  #     right.nil? ? @right = Node.new(value) : right.add_recursive(other_value)
  #   else
  #     nil
  #   end
  # end

  public attr_accessor :value, :left, :right
end

class BinaryTree
  attr_accessor :root

  def initialize
    root = nil
  end

  def add(value)
    iter = root

    if iter == nil
      @root = Node.new(value)
    else
      root.add(value)
      # root.add_recursive(value)
      # prev
      # while iter != nil
      #   prev = iter
      #   iter = iter.value < value ? iter.right : iter.left
      # end
      # prev.add(value)
    end
  end

  def find(value)
    iter = root
    return if iter.nil?

    while iter != nil && iter.value != value
      iter = iter.value < value ? iter.right : iter.left
    end
    iter != nil && iter.value == value ? iter : nil
  end

  def delete(value)

  end

  def to_s(node)
    if node.nil?
      return
    end
    p node.value
    to_s(node.left)
    to_s(node.right)
  end

  # c Node
  # def to_s
  #   @node.to_s
  # end

end

tree = BinaryTree.new

tree.add(10)
tree.add(20)
tree.add(30)
tree.add(40)
tree.add(34)
tree.add(5)

p tree.find(20)
p tree.find(40)
p tree.find(35) #...

p tree
