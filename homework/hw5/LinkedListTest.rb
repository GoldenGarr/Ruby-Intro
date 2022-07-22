list = LinkedList.new

list.append(3)
list.append(5)
list.append(10)
puts list #=> (3, 5, 10)

list.append_after(3, 15)
puts list #=> (3, 15, 5, 10)
list.append_after(10, 25)
puts list #=> (3, 15, 5, 10, 25)

list.delete(10)
list.find(25)