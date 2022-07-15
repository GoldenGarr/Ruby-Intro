=begin
Дан массив с числами, необходимо вернуть массив в проставленными рангами для этих чисел.
Наибольшее число имеет ранг 1, следующее за ним ранг 2 и так далее.
Одинаковые числа имеют одинаковый ранг, но при этом счетчик ранга увеличивается для следующего отличающего числа
=end

# Solution with group_by and to_h showcase
def rank_array(arr)
  tmp = arr.sort.reverse

  dict = arr.group_by { |elem| elem }.map {
    |key, | [key, tmp.index(key) + 1]
  }.to_h

  arr.map { |elem| dict[elem] }
end

# from the lesson
def ranks(arr)
  tmp = arr.sort.reverse

  arr.map{ |elem| tmp.index(elem) + 1 }
end


p rank_array([9, 3, 6, 10, 3])
p ranks([9, 3, 6, 10, 3])


p ranks([3, 3, 3, 3, 3, 5, 1])
p rank_array([3, 3, 3, 3, 3, 5, 1])
