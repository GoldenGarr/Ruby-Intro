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
