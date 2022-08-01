=begin
Нужно реализовать класс LinkedList,
в котором можно будет хранить элементы класса Node.
У класса должны быть методы для добавления в конец
  и произвольную позицию, удаления и поиска элемента.
Классы должны быть описаны в разных файлах

У класса должен быть реализован метод to_s для лаконичного отображения.
=end

require_relative 'Node'

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    if head == nil
      @head = Node.new(value, nil)
      return
    end

    iter = head
    while iter.next_ != nil
      iter = iter.next_
    end
    iter.next_ = Node.new(value, nil)
  end

  def to_s
    string = ''
    iter = head

    if iter == nil
      return '()'
    end

    while iter.next_ != nil
      string << iter.value.to_s + ', '
      iter = iter.next_
    end
    '(' + string + iter.value.to_s + ')'
  end

  def append_after(at, value)
    iter = head
    if iter != nil
      while iter.value != at
        iter = iter.next_
      end
      iter.next_ = Node.new(value, iter.next_)
    end
  end

  def delete(at)
    iter = head
    prev = nil

    if iter != nil
      while iter.value != at
        prev = iter
        iter = iter.next_
      end

      if iter == head
        @head = head.next_
      else
        prev.next_ = iter.next_
      end
    end
  end

  def find(value)
    iter = head
    if iter != nil
      while iter != nil && iter.value != value
        iter = iter.next_
      end
    end

    iter == nil ? nil : iter
  end

  public attr_accessor :head
end

list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)

puts list #=> (3, 5, 10)
#
list.append_after(3, 15)
puts list #=> (3, 15, 5, 10)
list.append_after(10, 25)
puts list #=> (3, 15, 5, 10, 25)

list.delete(10)
puts list #=> (3, 15, 5, 25)

list.delete(3)
puts list #=> (15, 5, 25)

list.delete(5)
puts list #=> (15, 25)

p list.find(15)
p list.find(25)
p list.find(69)
