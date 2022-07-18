=begin
Написать функцию, которая преобразует строку в хеш.
Например, такая строка "a=1, b=2, c=3, d=4" станет { a: 1, b: 2, c: 3, d: 4}
=end

def hash(str)
  result = {}

  str.split(', ').each {
    |elem| result[elem.split('=')[0].to_sym] = elem.split('=')[1]
  }
  result
end

puts hash("a=1, b=2, c=3, d=4")